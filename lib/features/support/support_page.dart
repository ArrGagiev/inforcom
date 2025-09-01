import 'package:flutter/material.dart' hide Animation;
import 'package:inforcom/features/support/widgets/glass_effect.dart';
import 'package:inforcom/features/support/widgets/support_card.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/mapkit_factory.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
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
          },
        ),
        GlassEffect(),
        SupportCard(),
      ],
    );
  }
}
