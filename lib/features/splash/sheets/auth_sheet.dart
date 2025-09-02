import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inforcom/blocs/auth_bloc/auth_bloc.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/core/widgets/pin_code_field/pin_code_field.dart';
import 'package:inforcom/core/widgets/text_form/app_text_form.dart';
import 'package:inforcom/data/models/auth_models.dart';
import 'package:inforcom/features/splash/sheets/services/validation_service.dart';
import 'package:inforcom/features/splash/sheets/sms_verification_sheet.dart';
import 'package:inforcom/features/splash/sheets/widgets/close_icon_button.dart';
import 'package:inforcom/features/splash/sheets/widgets/privacy_agreement_text.dart';

class AuthSheet extends StatefulWidget {
  const AuthSheet({super.key});

  @override
  State<AuthSheet> createState() => _AuthSheetState();
}

class _AuthSheetState extends State<AuthSheet> {
  final _phoneController = TextEditingController();
  final _cardnoController = TextEditingController();
  final _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      child: CloseIconButton(),
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
                  type: ValidationType.phoneNumber,
                  controller: _phoneController,
                  validator: ValidationService.validatePhoneNumber,
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
                  type: ValidationType.cardNumber,
                  controller: _cardnoController,
                  validator: ValidationService.validateCardNumber,
                ),
                SizedBox(height: 16),
                Text(
                  'Введите ПИН-код карты',
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 8),
                PinCodeField(
                  length: 4,
                  controller: _pinController,
                  validator: ValidationService.validatePinCode,
                ),
                SizedBox(height: 24),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return PrimaryButton(
                      iconWidget: state is AuthLoading
                          ? CircularProgressIndicator()
                          : null,
                      title: 'Получить код',
                      onPressed: state is AuthLoading ? null : _submitForm,
                    );
                  },
                ),
                SizedBox(height: 16),
                PrivacyAgreementText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final request = LoginStep1Request(
        phone: _phoneController.text,
        cardno: _cardnoController.text,
        pin: _pinController.text,
      );
      context.read<AuthBloc>().add(LoginStep1Requested(request: request));
    }
  }
}
