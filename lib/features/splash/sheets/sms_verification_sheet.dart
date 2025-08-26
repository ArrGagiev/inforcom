import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/core/widgets/pin_code_field/pin_code_field.dart';

class SmsVerificationSheet extends StatelessWidget {
  const SmsVerificationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    width: 20,
                    AppIcons.backArrow,
                    colorFilter: ColorFilter.mode(
                      AppColors.secondaryText,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Text(
                  'Ввод кода',
                  style: AppTextStyles.title1.copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    width: 20,
                    AppIcons.close,
                    colorFilter: ColorFilter.mode(
                      AppColors.secondaryText,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Введите код из СМС Мы отправили код на номер +7 988 987-99-00',
              style: AppTextStyles.body2.copyWith(color: AppColors.primaryText),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),

            PinCodeField(length: 5),
            SizedBox(height: 24),
            PrimaryButton(title: 'Отправить код повторно (2:59)'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
