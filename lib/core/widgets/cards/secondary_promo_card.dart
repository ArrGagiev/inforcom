import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/routing/app_routes.dart';

class SecondaryPromoCard extends StatelessWidget {
  const SecondaryPromoCard({
    super.key,
    required this.image,
    required this.title,
    this.width = 242,
    this.height = 188,
  });

  final String image;
  final String title;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTextStyles.body1.copyWith(
      color: AppColors.primaryText,
    );
    return GestureDetector(
      onTap: () => context.push(AppRoutes.promoDetailsFull),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SizedBox(
              width: width,
              height: 38,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.white.withAlpha(980)),
                child: Center(child: Text(title, style: titleStyle)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
