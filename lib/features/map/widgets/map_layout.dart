import 'package:flutter/material.dart';

class MapLayout extends StatelessWidget {
  final Widget map;
  final List<Widget> sideButtons;
  final List<Widget> bottomButtons;

  const MapLayout({
    super.key,
    required this.map,
    this.sideButtons = const [],
    this.bottomButtons = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Основная карта
        Positioned.fill(child: map),

        // Боковые кнопки страницы
        if (sideButtons.isNotEmpty)
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: sideButtons,
            ),
          ),

        // Нижние кнопки странцы
        if (bottomButtons.isNotEmpty)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: bottomButtons,
              ),
            ),
          ),
      ],
    );
  }
}
