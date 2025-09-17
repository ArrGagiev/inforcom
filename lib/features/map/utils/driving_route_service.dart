import 'dart:async';
import 'dart:developer';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/directions.dart';

class DrivingRouteService {
  final DrivingRouter _drivingRouter;
  DrivingSession? _currentSession;

  DrivingRouteService()
    : _drivingRouter = DirectionsFactory.instance.createDrivingRouter(
        DrivingRouterType.Combined,
      );

  /// Построение маршрута между двумя точками
  Future<DrivingRoute?> calculateRoute({
    required Point startPoint,
    required Point endPoint,
    DrivingVehicleOptions? vehicleOptions,
  }) async {
    _currentSession?.cancel();

    final completer = Completer<DrivingRoute?>();

    final requestPoints = [
      RequestPoint(startPoint, RequestPointType.Waypoint, null, null, null),
      RequestPoint(endPoint, RequestPointType.Waypoint, null, null, null),
    ];

    // Создаем DrivingOptions с настройками по умолчанию
    final drivingOptions = DrivingOptions(
      routesCount: 1, // Получаем только один маршрут
    );

    // Используем переданные vehicleOptions или создаем по умолчанию
    final vehicleOpts = vehicleOptions ?? DrivingVehicleOptions();

    // Создаем listener для обработки результатов
    final routeListener = DrivingSessionRouteListener(
      onDrivingRoutes: (List<DrivingRoute> routes) {
        if (routes.isNotEmpty) {
          final route = routes.first;
          completer.complete(route);
        } else {
          completer.complete(null);
        }
      },
      onDrivingRoutesError: (error) {
        log('Ошибка построения маршрута: $error');
        completer.complete(null);
      },
    );

    // Вызываем метод с правильной сигнатурой
    _currentSession = _drivingRouter.requestRoutes(
      drivingOptions,
      vehicleOpts,
      routeListener,
      points: requestPoints,
    );

    return completer.future;
  }

  /// Получение информации о времени и расстоянии маршрута
  RouteInfo? getRouteInfo(DrivingRoute route) {
    try {
      final metadata = route.metadata;
      final weight = metadata.weight;

      return RouteInfo(
        time: weight.time.text,
        distance: weight.distance.text,
        timeWithTraffic: weight.timeWithTraffic.text,
      );
    } catch (e) {
      log('Ошибка получения информации о маршруте: $e');
      return null;
    }
  }

  /// Логирование информации о маршруте
  void logRouteInfo(DrivingRoute route) {
    final info = getRouteInfo(route);
    if (info != null) {
      log('Информация о маршруте:');
      log('Расстояние: ${info.distance}');
      log('Время: ${info.time}');
      if (info.timeWithTraffic != null) {
        log('Время с учетом пробок: ${info.timeWithTraffic}');
      }
    } else {
      log('Не удалось получить информацию о маршруте');
    }
  }

  /// Очистка ресурсов
  void dispose() {
    _currentSession?.cancel();
    _currentSession = null;
  }
}

/// Модель для хранения информации о маршруте
class RouteInfo {
  final String time;
  final String distance;
  final String? timeWithTraffic;

  RouteInfo({required this.time, required this.distance, this.timeWithTraffic});
}
