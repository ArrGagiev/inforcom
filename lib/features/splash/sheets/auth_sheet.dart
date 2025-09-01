import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inforcom/blocs/auth_bloc/auth_bloc.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/core/widgets/pin_code_field/pin_code_field.dart';
import 'package:inforcom/core/widgets/text_form/app_text_form.dart';
import 'package:inforcom/data/models/auth_models.dart';
import 'package:inforcom/features/splash/sheets/sms_verification_sheet.dart';

class AuthSheet extends StatefulWidget {
  const AuthSheet({super.key});

  @override
  State<AuthSheet> createState() => _AuthSheetState();
}

class _AuthSheetState extends State<AuthSheet> {
  final _phoneController = TextEditingController();
  final _cardnoController = TextEditingController();
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          // Показываем ошибку
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is LoginStep1Success) {
          // Переходим к следующему шагу когда получили успешный ответ
          log('Успешно! Токен: ${state.response.data.temporaryToken}');

          Navigator.pop(context);
          AppBottomSheet.showBottomSheet(
            context,
            heightPercent: 0.94,
            isKeyboardOnTop: true,
            useRootNavigator: false,
            child: SmsVerificationSheet(
              temporaryToken: state.response.data.temporaryToken,
              phoneNumber: _phoneController.text,
            ),
          );
        }
      },
      child: Padding(
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
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.primaryText,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              AppTextForm(
                labelText: 'Номер телефона',
                controller: _phoneController,
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
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 8),
              AppTextForm(
                labelText: 'Номер карты',
                controller: _cardnoController,
              ),
              SizedBox(height: 16),
              Text(
                'Введите ПИН-код карты',
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 8),
              PinCodeField(length: 4, controller: _pinController),
              SizedBox(height: 24),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return PrimaryButton(
                    title: state is AuthLoading
                        ? 'Отправка...'
                        : 'Получить код',
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            final request = LoginStep1Request(
                              phone: _phoneController.text,
                              cardno: _cardnoController.text,
                              pin: _pinController.text,
                            );
                            context.read<AuthBloc>().add(
                              LoginStep1Requested(request: request),
                            );
                          },
                  );
                },
              ),
              SizedBox(height: 16),
              PrivacyAgreementText(),
            ],
          ),
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
