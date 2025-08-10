import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:inforcom/core/resources/app_images.dart';

class AutoScrollCarousel extends StatelessWidget {
  final List<String> imageAssets = [
    AppImages.gazpromLogo,
    AppImages.lukoilLogo,
    AppImages.rosneftLogo,
    AppImages.tatneftLogo,
  ];

  AutoScrollCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 52,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          pauseAutoPlayOnTouch: true, // Пауза при касании
          enlargeCenterPage: true, // Увеличение центрального элемента
        ),
        items: imageAssets.map((assetPath) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                assetPath,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
