import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({super.key, required this.length, this.controller});
  final int length;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      enableActiveFill: true,
      cursorColor: AppColors.accent2,
      keyboardType: TextInputType.number,
      controller: controller,
      // obscureText: false,
      length: length,
      textStyle: AppTextStyles.body2,
      animationType: AnimationType.fade,
      animationDuration: const Duration(milliseconds: 200),
      appContext: context,
      pinTheme: _pinTheme,
      // onCompleted: (value) {
      //   log(value);
      // },
      // onChanged: (value) {
      //   log(value);
      // },
    );
  }
}

final PinTheme _pinTheme = PinTheme(
  shape: PinCodeFieldShape.box,
  borderRadius: BorderRadius.circular(12),
  fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 4),
  fieldWidth: 40,
  fieldHeight: 52,
  inactiveColor: AppColors.lightGray,
  activeColor: AppColors.accent2,
  selectedColor: AppColors.accent,
  activeFillColor: AppColors.primary,
  inactiveFillColor: AppColors.primary,
  selectedFillColor: AppColors.primary,
  disabledColor: AppColors.lightGray,
  errorBorderColor: AppColors.red,
  disabledBorderWidth: 1,
  inactiveBorderWidth: 1,
  selectedBorderWidth: 1,
  activeBorderWidth: 1,
  errorBorderWidth: 1,
  borderWidth: 1,
);
