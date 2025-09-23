import 'dart:developer';
import 'package:flutter/material.dart' hide ImageProvider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inforcom/blocs/auth_bloc/auth_bloc.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/core/widgets/dialog/dialog.dart';
import 'package:inforcom/features/map/sheets/address_search/geolocation_dialog.dart';
import 'package:inforcom/features/map/sheets/address_search/address_search_sheet.dart';
import 'package:inforcom/features/map/sheets/address_search/selected_address_sheet.dart';
import 'package:inforcom/features/map/utils/camera_listener_service.dart';
import 'package:inforcom/features/map/utils/cluster_service.dart';
import 'package:inforcom/features/map/utils/driving_route_service.dart';
import 'package:inforcom/features/map/utils/search_service/address_search_provider.dart';
import 'package:inforcom/features/map/widgets/map_layout.dart';
import 'package:inforcom/features/map/sheets/fuel_filters/fuel_filters_sheet.dart';
import 'package:inforcom/features/map/utils/zoom_controller.dart';
import 'package:inforcom/features/map/widgets/buttons/action_button.dart';
import 'package:inforcom/features/map/widgets/buttons/side_action_button.dart';
import 'package:inforcom/features/map/widgets/buttons/traffic_toggle_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_maps_mapkit/mapkit.dart' hide LocationSettings;
import 'package:yandex_maps_mapkit/mapkit_factory.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';
import 'package:yandex_maps_mapkit/image.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  CameraListenerService? _cameraListenerService;
  MapZoomController? _zoomController;
  MapWindow? _mapWindow;
  PlacemarkMapObject? _userPlacemark;
  final ClusterService _clusterService = ClusterService();
  final DrivingRouteService _drivingRouteService = DrivingRouteService();
  Point? _currentUserLocation;

  Future<bool> _requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    return status.isGranted;
  }

  Future<void> _goToMyLocation() async {
    bool granted = await _requestLocationPermission();
    if (!granted) {
      _showLocationDialog();
      return;
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationDialog();
      return;
    }

    final pos = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    final point = Point(latitude: pos.latitude, longitude: pos.longitude);
    _currentUserLocation = point;

    _mapWindow?.map.move(
      CameraPosition(point, zoom: 15.0, azimuth: 0, tilt: 0),
    );

    if (_userPlacemark == null) {
      final imageProvider = ImageProvider.fromImageProvider(
        const AssetImage(AppIcons.mapPoint),
      );
      _userPlacemark = _mapWindow!.map.mapObjects.addPlacemark()
        ..geometry = point
        ..setIcon(imageProvider);

      _userPlacemark!.setIconStyle(IconStyle(scale: 1.8));
    } else {
      _userPlacemark!.geometry = point;
    }
  }

  void _showLocationDialog() {
    AppDialog.showCustomDialog(
      context: context,
      widthPercent: 0.8,
      child: GeolocationDialog(),
    );
  }

  /// Построение маршрута до точки
  Future<void> _buildRouteToPoint(Point destinationPoint) async {
    if (_currentUserLocation == null) {
      log('Неизвестно текущее местоположение');
      return;
    }

    try {
      final route = await _drivingRouteService.calculateRoute(
        startPoint: _currentUserLocation!,
        endPoint: destinationPoint,
      );

      if (route != null) {
        _drivingRouteService.logRouteInfo(route);

        final routeInfo = _drivingRouteService.getRouteInfo(route);
        if (routeInfo != null) {
          log('Маршрут построен успешно!');
          log('Расстояние: ${routeInfo.distance}');
          log('Время: ${routeInfo.time}');

          // Здесь можно показать информацию о маршруте в UI
          // Например, открыть bottom sheet с информацией
        }
      } else {
        log('Не удалось построить маршрут');
      }
    } catch (e) {
      log('Ошибка при построении маршрута: $e');
    }
  }

  void _addTestPoints() {
    final points = [
      Point(latitude: 55.751225, longitude: 37.62954),
      Point(latitude: 55.752, longitude: 37.63),
      Point(latitude: 55.753, longitude: 37.631),
      Point(latitude: 55.754, longitude: 37.632),
      Point(latitude: 55.755, longitude: 37.633),
      Point(latitude: 55.756, longitude: 37.634),
    ];

    _clusterService.addPoints(points);
  }

  //********************************************************************/
  // Метод для расчета информации о маршруте
  Future<RouteInfo?> _calculateRouteInfo(Point destinationPoint) async {
    if (_currentUserLocation == null) {
      log('Неизвестно текущее местоположение');
      return null;
    }

    try {
      final route = await _drivingRouteService.calculateRoute(
        startPoint: _currentUserLocation!,
        endPoint: destinationPoint,
      );

      if (route != null) {
        return _drivingRouteService.getRouteInfo(route);
      }
    } catch (e) {
      log('Ошибка при расчете маршрута: $e');
    }
    return null;
  }

  // Метод для отображения sheet с выбранным адресом
  void _showSelectedAddressSheet(
    BuildContext context, {
    required String address,
    required Point point,
    required RouteInfo? routeInfo,
  }) {
    AppBottomSheet.showBottomSheet(
      context,
      child: SelectedAddressSheet(
        address: address,
        duration: routeInfo?.time ?? 'Время неизвестно',
        distance: routeInfo?.distance ?? 'Расстояние неизвестно',
        onBuildRoute: () {
          _buildRouteToPoint(point);
          // Дополнительная логика при построении маршрута
        },
      ),
    );
  }
  //********************************************************************/

  @override
  void dispose() {
    _clusterService.dispose();
    _cameraListenerService?.stopListening();
    _drivingRouteService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MapLayout(
          map: YandexMap(
            onMapCreated: (mapWindow) {
              mapkit.onStart();
              _mapWindow = mapWindow;

              final startPoint = Point(
                latitude: 55.751225,
                longitude: 37.62954,
              );
              _currentUserLocation = startPoint;

              final imageProvider = ImageProvider.fromImageProvider(
                const AssetImage(AppIcons.mapPoint),
              );

              mapWindow.map.move(
                CameraPosition(startPoint, zoom: 15.0, azimuth: 0, tilt: 0),
              );
              _userPlacemark = _mapWindow!.map.mapObjects.addPlacemark()
                ..geometry = startPoint
                ..setIcon(imageProvider);

              _userPlacemark!.setIconStyle(IconStyle(scale: 1.2));

              _zoomController = MapZoomController(mapWindow);
              _clusterService.initialize(mapWindow);
              _addTestPoints();

              _cameraListenerService = CameraListenerService(mapWindow);
              _cameraListenerService!.startListening();
            },
          ),
          sideButtons: [
            SideActionButton(
              iconName: AppIcons.plus,
              onPressed: () => _zoomController?.zoomIn(),
            ),
            SideActionButton(
              iconName: AppIcons.minus,
              onPressed: () => _zoomController?.zoomOut(),
            ),
            SizedBox(height: 28),
            SideActionButton(
              iconName: AppIcons.nearMe,
              onPressed: _goToMyLocation,
            ),
          ],
          bottomButtons: [
            ActionButton(
              icon: AppIcons.filter,
              onPressed: () {
                AppBottomSheet.showBottomSheet(
                  context,
                  child: const FuelFiltersSheet(),
                );
              },
            ),
            const SizedBox(width: 4),
            ActionButton(
              icon: AppIcons.route,
              onPressed: () {
                AppBottomSheet.showBottomSheet(
                  context,
                  isKeyboardOnTop: true,
                  child: AddressSearchWidget(
                    onAddressSelected: (point) {
                      _buildRouteToPoint(point);
                    },
                    // Логика обработки выбора предложения
                    onSuggestionSelected: (suggestion) async {
                      final provider = AddressSearchProvider();
                      final point = await provider.selectSuggestion(
                        suggestion,
                        boundingBox: BoundingBox(
                          Point(latitude: 35.0, longitude: 19.0),
                          Point(latitude: 82.0, longitude: 190.0),
                        ),
                      );

                      if (point != null) {
                        // Закрываем поисковый sheet
                        // ignore: use_build_context_synchronously
                        Navigator.of(context, rootNavigator: true).pop();

                        // Рассчитываем информацию о маршруте
                        final routeInfo = await _calculateRouteInfo(point);

                        // Открываем sheet с информацией об адресе
                        _showSelectedAddressSheet(
                          // ignore: use_build_context_synchronously
                          context,
                          address: suggestion.title.text,
                          point: point,
                          routeInfo: routeInfo,
                        );
                      }
                    },
                  ),
                );
              },
            ),

            const Spacer(),
            if (state is AuthAuthenticated)
              TrafficToggleButton(onPressed: () {}),
          ],
        );
      },
    );
  }
}
