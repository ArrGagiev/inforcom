import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/routing/app_routes.dart';
import 'package:inforcom/features/main/widgets/card_number_area.dart';
import 'package:inforcom/features/main/widgets/promo_title_area.dart';
import 'package:inforcom/features/main/widgets/promo_cards_horizontal.dart';
import 'package:inforcom/features/main/widgets/promo_cards_vertical.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final inforcomLogo = Image.asset(
      AppImages.inforcomLogo,
      width: 197,
      height: 65,
    );

    final inforcomCard = Image.asset(
      AppImages.inforcomCard,
      width: 332,
      height: 211,
    );

    final mainTitle = Text(
      'Навигатор посети\nАЗС Инфорком',
      style: AppTextStyles.h2,
      textAlign: TextAlign.center,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 76),
          inforcomLogo,
          const SizedBox(height: 24),
          mainTitle,
          const SizedBox(height: 20),
          inforcomCard,
          const SizedBox(height: 16),
          // if(isAuth)
          CardNumberArea(onTap: () {}),
          const SizedBox(height: 20),
          PromoCardsVertical(),
          const SizedBox(height: 24),
          PromoTitleArea(onTap: () => GoRouter.of(context).go(AppRoutes.promo)),
          const SizedBox(height: 16),
          PromoCardsHorizontal(),
          const SizedBox(height: 94),
        ],
      ),
    );
  }
}
