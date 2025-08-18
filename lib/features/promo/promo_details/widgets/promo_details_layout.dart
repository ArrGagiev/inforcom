import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_images.dart';

class PromoDetailsLayout extends StatelessWidget {
  const PromoDetailsLayout({super.key, this.promoImage, this.child});

  final String? promoImage;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // Высота белой области
    final panelHeight = screenHeight * 0.7;
    // Отступ сверху
    final topOffset = screenHeight * 0.18;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.4,
            child: ClipRect(
              child: Transform.scale(
                // Коэффициент увеличения: scale
                scale: 1.8,
                child: Image(
                  // TODO: Тут должна быть картинка заглушка попросить у Евгения
                  image: AssetImage(promoImage ?? AppImages.promotion),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),

          Positioned(
            // Начинается с: topOffset
            top: topOffset,
            left: 0,
            right: 0,
            height: panelHeight,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withAlpha(235),
                      Colors.white.withAlpha(230),
                      Colors.white,
                      Colors.white,
                      Colors.white,
                    ],
                    stops: const [0.0, 0.03, 0.2, 0.8, 1.0],
                  ),
                ),
                child: SingleChildScrollView(child: child),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
