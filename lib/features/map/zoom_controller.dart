import 'package:yandex_maps_mapkit/mapkit.dart';

class MapZoomController {
  final MapWindow mapWindow;

  MapZoomController(this.mapWindow);

  double get _currentZoom => mapWindow.map.cameraPosition.zoom;

  void zoomIn() {
    final newZoom = _currentZoom + 1;
    mapWindow.map.move(
      CameraPosition(
        mapWindow.map.cameraPosition.target,
        zoom: newZoom,
        azimuth: 0,
        tilt: 0,
      ),
    );
  }

  void zoomOut() {
    final newZoom = _currentZoom - 1;
    mapWindow.map.move(
      CameraPosition(
        mapWindow.map.cameraPosition.target,
        zoom: newZoom,
        azimuth: 0,
        tilt: 0,
      ),
    );
  }
}
