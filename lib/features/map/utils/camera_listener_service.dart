// utils/camera_listener_service.dart
import 'dart:async';
import 'dart:developer';
import 'package:yandex_maps_mapkit/mapkit.dart';

class CameraListenerService implements MapCameraListener {
  final MapWindow mapWindow;
  Timer? _debounceTimer;

  CameraListenerService(this.mapWindow);

  @override
  void onCameraPositionChanged(
    Map map,
    CameraPosition cameraPosition,
    CameraUpdateReason reason,
    bool finished,
  ) {
    // Логируем только когда движение завершено (с дебаунсом)
    if (finished) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        final visibleRegion = mapWindow.map.visibleRegion.toString();
        log('Visible Region: $visibleRegion');
        log('Zoom: ${cameraPosition.zoom}');
        log(
          'Center: ${cameraPosition.target.latitude}, ${cameraPosition.target.longitude}',
        );
      });
    }
  }

  void startListening() {
    mapWindow.map.addCameraListener(this);
  }

  void stopListening() {
    _debounceTimer?.cancel();
    mapWindow.map.removeCameraListener(this);
  }
}
