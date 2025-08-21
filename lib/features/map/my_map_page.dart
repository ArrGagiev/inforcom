import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/features/map/sheets/fuel_filters/fuel_filters_sheet.dart';
import 'package:inforcom/features/map/sheets/route_building/route_building_sheet.dart';
import 'package:inforcom/features/map/widgets/map_button.dart';
import 'package:inforcom/features/map/widgets/map_traffic_button.dart';
import 'package:inforcom/features/map/zoom_controller.dart';
import 'package:yandex_maps_mapkit/mapkit.dart' hide Icon;
import 'package:yandex_maps_mapkit/mapkit_factory.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';

class MyMapPage extends StatefulWidget {
  const MyMapPage({super.key});

  @override
  State<MyMapPage> createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  // MapWindow? _mapWindow;
  MapZoomController? _zoomController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (mapWindow) {
              debugPrint('Map created!');
              mapkit.onStart();
              mapWindow.map.move(
                CameraPosition(
                  Point(latitude: 55.751225, longitude: 37.62954),
                  zoom: 15.0,
                  azimuth: 0,
                  tilt: 0,
                ),
              );
              setState(() {
                _zoomController = MapZoomController(mapWindow);
              });
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  onPressed: () => _zoomController?.zoomIn(),
                  mini: true,
                  child: SvgPicture.asset(AppIcons.plus),
                ),
                FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  onPressed: () => _zoomController?.zoomOut(),
                  mini: true,
                  child: SvgPicture.asset(AppIcons.minus),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 54, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MapButton(
                    onPressed: () {
                      AppBottomSheet.showBottomSheet(
                        context,
                        child: const FuelFiltersSheet(),
                      );
                    },
                    icon: AppIcons.filter,
                  ),
                  const SizedBox(width: 4),
                  MapButton(
                    onPressed: () {
                      AppBottomSheet.showBottomSheet(
                        context,
                        isKeyboardOnTop: true,
                        child: const RouteBuildingSheet(),
                      );
                    },
                    icon: AppIcons.route,
                  ),
                  Spacer(),
                  MapTrafficButton(onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
