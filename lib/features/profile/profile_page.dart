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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    'Выйти',
                    style: AppTextStyles.body1.copyWith(color: AppColors.red),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            InforcomCard(cardNumber: '1234 5678 9012 3456'),
            SizedBox(height: 16),
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
            SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Вид топлива',
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 16),
                FuelTypeSelector(),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Установленные лимиты:',
              style: AppTextStyles.body1.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Бензин: 35 л. (24 часа)',
              style: AppTextStyles.body1.copyWith(color: AppColors.primaryText),
            ),
            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
