import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class SecondaryPromoCard extends StatelessWidget {
  const SecondaryPromoCard({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTextStyles.body1.copyWith(
      color: AppColors.primaryText,
    );
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(image, fit: BoxFit.cover, width: 242, height: 188),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            width: 242,
            height: 38,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white.withAlpha(980)),
              child: Center(child: Text(title, style: titleStyle)),
            ),
          ),
        ),
      ],
    );
  }
}
