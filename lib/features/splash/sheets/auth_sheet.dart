import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/core/widgets/pin_code_field/pin_code_field.dart';
import 'package:inforcom/core/widgets/text_form/app_text_form.dart';
import 'package:inforcom/features/splash/sheets/sms_verification_sheet.dart';

class AuthSheet extends StatelessWidget {
  const AuthSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'Ввод номера',
                  style: AppTextStyles.title1.copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
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
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Введите ваш номер телефона,чтобы получить код для подтверждения.',
              style: AppTextStyles.body2.copyWith(color: AppColors.primaryText),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            AppTextForm(
              labelText: 'Номер телефона',
              type: ValidationType.phoneNumber,
            ),
            SizedBox(height: 24),
            Text(
              'Ввод данных карты',
              style: AppTextStyles.title1.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Введите номер карты',
              style: AppTextStyles.body2.copyWith(color: AppColors.primaryText),
            ),
            SizedBox(height: 8),
            AppTextForm(
              labelText: 'Номер карты',
              type: ValidationType.cardNumber,
            ),
            SizedBox(height: 16),
            Text(
              'Введите ПИН-код карты',
              style: AppTextStyles.body2.copyWith(color: AppColors.primaryText),
            ),
            SizedBox(height: 8),
            PinCodeField(length: 4),
            SizedBox(height: 24),
            PrimaryButton(
              title: 'Получить код',
              onPressed: () {
                // Navigator.pop(context);
                AppBottomSheet.showBottomSheet(
                  context,
                  heightPercent: 0.94,
                  isKeyboardOnTop: true,
                  useRootNavigator: false,
                  child: const SmsVerificationSheet(),
                );
              },
            ),
            SizedBox(height: 16),
            PrivacyAgreementText(),
          ],
        ),
      ),
    );
  }
}

class PrivacyAgreementText extends StatelessWidget {
  const PrivacyAgreementText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.body2.copyWith(color: AppColors.primaryText),
        children: [
          const TextSpan(text: 'Авторизуясь, вы соглашаетесь c '),
          TextSpan(
            text: 'Политикой по обработке персональных данных',
            style: AppTextStyles.body2.copyWith(
              color: AppColors.accent,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Обработка нажатия на политику
                log('Политика обработки данных');
              },
          ),
          const TextSpan(text: ' и принимаете '),
          TextSpan(
            text: 'Пользовательское соглашение',
            style: AppTextStyles.body2.copyWith(
              color: AppColors.accent,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Обработка нажатия на соглашение
                log('Пользовательское соглашение');
              },
          ),
        ],
      ),
    );
  }
}
