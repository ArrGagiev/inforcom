import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class PrimaryPromoCard extends StatelessWidget {
  const PrimaryPromoCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTextStyles.title1.copyWith(color: AppColors.primary);
    final subtitleStyle = AppTextStyles.body2.copyWith(
      color: AppColors.primary,
    );

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: titleStyle),
              Text(subtitle, style: subtitleStyle),
            ],
          ),
        ),
      ],
    );
  }
}
