import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:inforcom/blocs/auth_bloc/auth_bloc.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/routing/app_routes.dart';
import 'package:inforcom/core/services/secure_storage_service.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/core/widgets/pin_code_field/pin_code_field.dart';
import 'package:inforcom/data/models/auth_models.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      // Ключевое изменение: передаем тот же экземпляр BLoC
      value: BlocProvider.of<AuthBloc>(context),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          // log('Current state: ${state.runtimeType}');

          // if (state is AuthFailure) {
          //   log('Auth error: ${state.error}');
          //   ScaffoldMessenger.of(
          //     context,
          //   ).showSnackBar(SnackBar(content: Text(state.error)));
          // } else if (state is LoginStep2Success) {
          //   log('Success! Token: ${state.response.accessToken}');
          //   ScaffoldMessenger.of(
          //     context,
          //   ).showSnackBar(SnackBar(content: Text('Успешная авторизация!')));

          //   // TODO: Дополнительная логика после успеха

          //   // _handleSuccess(context, state.response.accessToken);
          // }
          if (state is LoginStep2Success) {
            // Сохраняем токен
            await SecureStorageService.saveAccessToken(
              state.response.accessToken,
            );
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
            // ignore: use_build_context_synchronously
            context.go(AppRoutes.main);
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
              'Введите код из СМС\nМы отправили код на номер ${widget.phoneNumber}',
              style: AppTextStyles.body2.copyWith(color: AppColors.primaryText),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            PinCodeField(length: 4, controller: _smsController),
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
    );
  }

  void _submitCode(BuildContext context) {
    final smsCode = _smsController.text;

    // if (smsCode.isEmpty) {
    //   ScaffoldMessenger.of(
    //     context,
    //   ).showSnackBar(SnackBar(content: Text('Введите код из SMS')));
    //   return;
    // }

    log('Submitting code: $smsCode');
    log('Temporary token: ${widget.temporaryToken}');

    final request = LoginStep2Request(
      temporaryToken: widget.temporaryToken,
      verificationCode: smsCode,
    );

    context.read<AuthBloc>().add(LoginStep2Requested(request: request));
  }

  // void _handleSuccess(BuildContext context, String accessToken) async {
  //   // Сохраняем токен
  //   await SecureStorageService.saveAccessToken(accessToken);
  // }
}
