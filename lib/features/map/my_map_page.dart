import 'package:flutter/material.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/mapkit_factory.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';

class MyMapPage extends StatelessWidget {
  const MyMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    MapWindow? _mapWindow;
    return YandexMap(
      onMapCreated: (mapWindow) {
        debugPrint('Map created!');
        _mapWindow = mapWindow;
        mapkit.onStart();
        mapWindow.map.move(
          CameraPosition(
            Point(latitude: 55.751225, longitude: 37.62954),
            zoom: 15.0,
            azimuth: 0,
            tilt: 0,
          ),
        );
      },
    );
  }
}
