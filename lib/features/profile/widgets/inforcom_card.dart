import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class InforcomCard extends StatelessWidget {
  const InforcomCard({super.key, required this.cardNumber});

  final String cardNumber;

  static final _cardNumberStyle = AppTextStyles.h1.copyWith(
    color: AppColors.primary,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(AppImages.cardBackground, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 24,
            right: 24,
            child: Image.asset(AppImages.simpleLogo, width: 53),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            child: Text(cardNumber, style: _cardNumberStyle),
          ),
        ],
      ),
    );
  }
}
