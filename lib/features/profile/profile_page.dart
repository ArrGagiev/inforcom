import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/routing/app_routes.dart';
import 'package:inforcom/core/widgets/buttons/outline_button.dart';
import 'package:inforcom/features/profile/widgets/fuel_type_selector.dart';
import 'package:inforcom/features/profile/widgets/inforcom_card.dart';
import 'package:inforcom/features/profile/widgets/sign_out_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static final _titleStyle = 
  AppTextStyles.h3.copyWith(color: AppColors.primaryText);

  static final _secondaryTextStyle = 
  AppTextStyles.body1.copyWith(color: AppColors.secondaryText);

  static final _primaryTextStyle = 
  AppTextStyles.body1.copyWith(color: AppColors.primaryText);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 44),
            SignOutButton(onTap: () {}),
            const SizedBox(height: 24),
            const InforcomCard(cardNumber: '1234 5678 9012 3456'),
            const SizedBox(height: 16),
            OutlineButton(
              iconWidget: SvgPicture.asset(
                AppIcons.plus,
                colorFilter: ColorFilter.mode(
                  AppColors.accent,
                  BlendMode.srcIn,
                ),
              ),
              title: 'Добавить карту',
              onPressed: () {
                context.push(AppRoutes.addCardFull);
              },
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Вид топлива', style: _titleStyle),
                const SizedBox(height: 16),
                const FuelTypeSelector(),
              ],
            ),
            const SizedBox(height: 32),
            Text('Установленные лимиты:', style: _secondaryTextStyle),
            const SizedBox(height: 8),
            Text('Бензин: 35 л. (24 часа)', style: _primaryTextStyle),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
