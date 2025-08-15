import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/cards/primary_promo_card.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTextStyles.h3.copyWith(color: AppColors.primaryText);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 48),
          Text('Наши акции', style: titleStyle),
          SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: 12,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGray),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryPromoCard(
                      image: AppImages.promotion,
                      title: '40 000\nЗапчастей для\nкоммерческого транспорта',
                      subtitle: 'Оперативная доставка по России',
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }
}
