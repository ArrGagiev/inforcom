import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/widgets/cards/secondary_promo_card.dart';

class PromoCardsHorizontal extends StatelessWidget {
  const PromoCardsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
