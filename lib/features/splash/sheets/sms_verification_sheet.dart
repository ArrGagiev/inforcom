import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inforcom/blocs/auth_bloc/auth_bloc.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/routing/app_routes.dart';
import 'package:inforcom/core/services/secure_storage_service.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/core/widgets/pin_code_field/pin_code_field.dart';
import 'package:inforcom/data/models/auth_models.dart';
import 'package:inforcom/features/splash/sheets/services/validation_service.dart';
import 'package:inforcom/features/splash/sheets/widgets/back_icon_button.dart';
import 'package:inforcom/features/splash/sheets/widgets/close_icon_button.dart';

class SmsVerificationSheet extends StatefulWidget {
  final String temporaryToken;
  final String phoneNumber;

  const SmsVerificationSheet({
    super.key,
    required this.temporaryToken,
    required this.phoneNumber,
  });

  @override
  State<SmsVerificationSheet> createState() => _SmsVerificationSheetState();
}

class _SmsVerificationSheetState extends State<SmsVerificationSheet> {
  final _smsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      // Передаем тот же экземпляр BLoC что и в auth_sheet
      value: BlocProvider.of<AuthBloc>(context),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is LoginStep2Success) {
            // Сохраняем токен
            await SecureStorageService.saveAccessToken(
              state.response.accessToken,
            );
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
            // ignore: use_build_context_synchronously
            context.go(AppRoutes.main);
          } else if (state is AuthFailure) {
            // Показываем ошибку при неверном коде или success: false
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.red,
              ),
            );

            // Очищаем поле ввода при ошибке
            _smsController.clear();

            // Сбрасываем состояние ошибки
            Future.delayed(Duration(seconds: 1), () {
              context.read<AuthBloc>().add(CheckAuthStatus());
            });
          }
        },
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackIconButton(),
                  Text(
                    'Ввод кода',
                    style: AppTextStyles.title1.copyWith(
                      color: AppColors.primaryText,
                    ),
                  ),
                  CloseIconButton(),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Введите код из СМС\nМы отправили код на номер\n${widget.phoneNumber}',
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.primaryText,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              PinCodeField(
                length: 4,
                controller: _smsController,
                validator: ValidationService.validatePinCode,
              ),
              SizedBox(height: 24),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final isLoading = state is AuthLoading;

                  return PrimaryButton(
                    title: isLoading ? 'Отправка...' : 'Подтвердить',
                    onPressed: isLoading ? null : () => _submitCode(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitCode(BuildContext context) {
    final smsCode = _smsController.text;

    log('Submitting code: $smsCode');
    log('Temporary token: ${widget.temporaryToken}');

    final request = LoginStep2Request(
      temporaryToken: widget.temporaryToken,
      verificationCode: smsCode,
    );

    context.read<AuthBloc>().add(LoginStep2Requested(request: request));
  }
}
