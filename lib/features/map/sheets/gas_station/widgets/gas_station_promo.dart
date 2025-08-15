import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/cards/secondary_promo_card.dart';

class GasStationPromo extends StatelessWidget {
  const GasStationPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Акция:', style: AppTextStyles.body2),
        const SizedBox(height: 8),
        SizedBox(
          height: 110,
          child: ListView.separated(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              return SecondaryPromoCard(
                width: 180,
                height: 110,
                image: AppImages.promotion2,
                title: 'Скидка на ДТ от 6%',
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 16),
          ),
        ),
      ],
    );
  }
}
