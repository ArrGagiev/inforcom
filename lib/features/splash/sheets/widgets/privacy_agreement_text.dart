import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

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
                log('Пользовательское соглашение');
              },
          ),
        ],
      ),
    );
  }
}
