import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/routing/app_routes.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/core/widgets/buttons/outline_button.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/features/splash/sheets/auth_sheet.dart';
import 'package:inforcom/features/splash/widgets/auto_scroll_carousel.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 76),
            inforcomLogo,
            SizedBox(height: 100),
            inforcomCard,
            SizedBox(height: 32),
            PrimaryButton(
              margin: EdgeInsets.symmetric(horizontal: 42),
              title: 'Войти по номеру',
              onPressed: () {
                AppBottomSheet.showBottomSheet(
                  context,
                  heightPercent: 0.94,
                  isKeyboardOnTop: true,
                  useRootNavigator: false,
                  child: AuthSheet(),
                );
              },
            ),
            SizedBox(height: 8),
            OutlineButton(
              margin: EdgeInsets.symmetric(horizontal: 42),
              iconWidget: Icon(Icons.add, size: 24, color: AppColors.accent),
              title: 'Продолжить без регистрации',
              onPressed: () {
                context.go(AppRoutes.main);
              },
            ),
            SizedBox(height: 128),
            AutoScrollCarousel(),
            SizedBox(height: 32),
            Text(
              '12 000 АЗС в сети',
              style: AppTextStyles.body1.copyWith(color: AppColors.accent2),
            ),
            SizedBox(height: 58),
          ],
        ),
      ),
    );
  }
}
