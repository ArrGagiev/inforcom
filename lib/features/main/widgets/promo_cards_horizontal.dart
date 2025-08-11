import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/cards/secondary_promo_card.dart';
import 'package:inforcom/features/main/widgets/card_text_button.dart';

class PromoCardsHorizontal extends StatelessWidget {
  const PromoCardsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTextStyles.h3.copyWith(color: AppColors.primaryText);
    return Column(
      children: [
        // TODO: возможно стоит вынести отдельно, надо подумать как красивее
        //-----------------------------------------------------------------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Наши акции', style: titleStyle),
              CardTextButton(title: 'Посмотреть все', onTap: () {}),
            ],
          ),
        ),
        //-----------------------------------------------------------------------------
        const SizedBox(height: 16),
        //-----------------------------------------------------------------------------
        SizedBox(
          height: 188,
          child: ListView.separated(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              return SecondaryPromoCard(
                image: AppImages.promotion2,
                title: 'Скидка на ДТ от 6%',
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 16),
          ),
        ),

        //-----------------------------------------------------------------------------
      ],
    );
  }
}
