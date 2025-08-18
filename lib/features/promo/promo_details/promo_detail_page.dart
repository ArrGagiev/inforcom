import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/features/promo/promo_details/widgets/details_area.dart';
import 'package:inforcom/features/promo/promo_details/widgets/link_area.dart';
import 'package:inforcom/features/promo/promo_details/widgets/promo_details_layout.dart';
import 'package:inforcom/features/promo/promo_details/widgets/sale_area.dart';

class PromoDetailPage extends StatelessWidget {
  const PromoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PromoDetailsLayout(
      promoImage: AppImages.promotion,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            SaleArea(),
            SizedBox(height: 32),
            SizedBox(
              width: 250,
              child: Text(
                softWrap: true,
                'Моторные масла из Южной Кореи',
                style: AppTextStyles.h2.copyWith(color: AppColors.primaryText),
              ),
            ),
            SizedBox(height: 22),
            Text(
              'Подробности акции',
              style: AppTextStyles.title3.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8),
            DetailsArea(
              text:
                  'Оптовые цены! Оформить заказ можно через вашего менеджера, или по телефону.',
            ),
            SizedBox(height: 44),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinkArea(
                  color: AppColors.accent,
                  icon: AppIcons.web,
                  text: 'Перейти на сайт',
                ),
                LinkArea(
                  color: AppColors.accent2,
                  icon: AppIcons.web,
                  text: '+7 988 999 00 00',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
