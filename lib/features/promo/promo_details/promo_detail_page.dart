import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/features/promo/promo_details/widgets/promo_details_layout.dart';

class PromoDetailPage extends StatelessWidget {
  const PromoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PromoDetailsLayout(
      promoImage: AppImages.promotion,
      child: Column(
        children: [
          Center(
            child: Text(
              'Текст акции',
              style: AppTextStyles.h3.copyWith(color: AppColors.primaryText),
            ),
          ),
        ],
      ),
    );
  }
}
