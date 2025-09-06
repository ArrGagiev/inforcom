import 'package:flutter/material.dart' hide ImageProvider;
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:yandex_maps_mapkit/mapkit.dart' hide TextStyle;
import 'package:yandex_maps_mapkit/ui_view.dart';
import 'package:yandex_maps_mapkit/image.dart';

// Кастомный вид для кластера
class ClusterView extends StatelessWidget {
  final String text;

  const ClusterView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.accent, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.title3.copyWith(color: AppColors.primaryText),
          ),
        ),
      ),
    );
  }
}

// Реализация ClusterListener
final class ClusterListenerImpl implements ClusterListener {
  @override
  void onClusterAdded(Cluster cluster) {
    cluster.appearance.setView(
      ViewProvider(
        builder: () => ClusterView(text: "${cluster.placemarks.length}"),
      ),
    );
  }
}

class ClusterService {
  ClusterizedPlacemarkCollection? _clusterizedCollection;
  final ClusterListener _clusterListener = ClusterListenerImpl();
  MapWindow? _mapWindow;

  // Инициализация сервиса
  void initialize(MapWindow mapWindow) {
    _mapWindow = mapWindow;
    _createClusterizedCollection();
  }

  // Создание кластеризованной коллекции
  void _createClusterizedCollection() {
    if (_mapWindow == null) return;

    _clusterizedCollection = _mapWindow!.map.mapObjects
        .addClusterizedPlacemarkCollection(_clusterListener);
  }

  // Добавление точек для кластеризации
  void addPoints(List<Point> points) {
    if (_clusterizedCollection == null) return;

    final imageProvider = ImageProvider.fromImageProvider(
      const AssetImage(AppIcons.mapPoint),
    );

    for (final point in points) {
      _clusterizedCollection!.addPlacemark()
        ..geometry = point
        ..setIcon(imageProvider)
        ..setIconStyle(IconStyle(scale: 1.5));
    }

    // Обновляем кластеризацию
    updateClustering();
  }

  // Обновление кластеризации
  void updateClustering({double clusterRadius = 60, int minZoom = 15}) {
    _clusterizedCollection?.clusterPlacemarks(
      clusterRadius: clusterRadius,
      minZoom: minZoom,
    );
  }

  // Очистка всех точек
  void clearPoints() {
    _clusterizedCollection?.clear();
    updateClustering();
  }

  // Удаление коллекции
  void dispose() {
    _clusterizedCollection?.remove;
    _clusterizedCollection = null;
    _mapWindow = null;
  }

  // Получение коллекции (для расширенного использования)
  ClusterizedPlacemarkCollection? get collection => _clusterizedCollection;
}
