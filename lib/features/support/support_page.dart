import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/features/map/my_map_page.dart';
import 'package:inforcom/features/support/widgets/glass_effect.dart';
import 'package:inforcom/features/support/widgets/support_card.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        // Image.asset(AppImages.map, fit: BoxFit.cover),
        MyMapPage(),
        GlassEffect(),
        SupportCard(),
      ],
    );
  }
}
