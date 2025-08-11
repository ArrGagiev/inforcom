import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/widgets/cards/primary_promo_card.dart';

class PromoCardsVertical extends StatelessWidget {
  const PromoCardsVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (BuildContext context, int index) {
        return PrimaryPromoCard(
          image: AppImages.promotion,
          title: '40 000\nЗапчастей для\nкоммерческого транспорта',
          subtitle: 'Оперативная доставка по России',
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
