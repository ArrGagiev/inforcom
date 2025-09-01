import 'dart:developer';
import 'package:flutter/material.dart' hide ImageProvider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inforcom/blocs/auth_bloc/auth_bloc.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/core/widgets/dialog/dialog.dart';
import 'package:inforcom/features/map/sheets/route_building/geolocation_dialog.dart';
import 'package:inforcom/features/map/widgets/map_layout.dart';
import 'package:inforcom/features/map/sheets/fuel_filters/fuel_filters_sheet.dart';
import 'package:inforcom/features/map/sheets/route_building/route_building_sheet.dart';
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
  MapZoomController? _zoomController;
  MapWindow? _mapWindow;

  PlacemarkMapObject? _userPlacemark;

  // Запрос разрешения через permission_handler
  Future<bool> _requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    return status.isGranted;
  }

  Future<void> _goToMyLocation() async {
    // Сначала проверяем разрешение
    bool granted = await _requestLocationPermission();
    if (!granted) {
      _showLocationDialog();
      return;
    }

    // Проверяем включен ли GPS
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationDialog();
      return;
    }

    // Получаем позицию
    final pos = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    final point = Point(latitude: pos.latitude, longitude: pos.longitude);

    // Перемещаем карту
    _mapWindow?.map.move(
      CameraPosition(point, zoom: 15.0, azimuth: 0, tilt: 0),
    );

    // Добавляем или обновляем метку
    if (_userPlacemark == null) {
      final imageProvider = ImageProvider.fromImageProvider(
        const AssetImage(AppIcons.mapPoint),
      );
      _userPlacemark = _mapWindow!.map.mapObjects.addPlacemark()
        ..geometry = point
        ..setIcon(imageProvider);

      _userPlacemark!.setIconStyle(IconStyle(scale: 2.5)); // Размер
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MapLayout(
          map: YandexMap(
            onMapCreated: (mapWindow) {
              mapkit.onStart();
              _mapWindow = mapWindow;

              // стартовая позиция — Мск
              mapWindow.map.move(
                CameraPosition(
                  const Point(latitude: 55.751225, longitude: 37.62954),
                  zoom: 15.0,
                  azimuth: 0,
                  tilt: 0,
                ),
              );

              _zoomController = MapZoomController(mapWindow);
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
              onPressed: () {
                log('goToMyLocation');
                _goToMyLocation();
              },
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
                  child: const RouteBuildingSheet(),
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
