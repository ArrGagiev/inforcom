import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField2 extends StatefulWidget {
  final int lenght;
  final ValueChanged<String>? onFullCodeEntered;
  final String? correctPin; // Для проверки

  const PinCodeField2({
    super.key,
    required this.lenght,
    this.onFullCodeEntered,
    this.correctPin,
  });

  @override
  State<PinCodeField2> createState() => _PinCodeField2State();
}

class _PinCodeField2State extends State<PinCodeField2> {
  late final TextEditingController _controller;
  bool _hasError = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _validate(String pincode) {
    final newHasError = pincode.isNotEmpty && pincode.length < widget.lenght;

    setState(() {
      _hasError = newHasError;
      _errorText = newHasError
          ? 'Код должен быть не менее ${widget.lenght} цифр'
          : null;
    });

    if (pincode.length == widget.lenght) {
      if (widget.correctPin != null && pincode != widget.correctPin) {
        setState(() {
          _hasError = true;
          _errorText = 'Неверный код';
        });
      }
      widget.onFullCodeEntered?.call(pincode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.center,
          enableActiveFill: true,
          cursorColor: AppColors.accent2,
          keyboardType: TextInputType.number,
          controller: _controller,
          length: widget.lenght,
          textStyle: AppTextStyles.body2,
          animationType: AnimationType.fade,
          animationDuration: const Duration(milliseconds: 100),
          appContext: context,
          pinTheme: _pinTheme,
          onChanged: _validate,
        ),
        if (_hasError && _errorText != null)
          Text(
            _errorText!,
            style: AppTextStyles.body2.copyWith(color: AppColors.red),
          ),
      ],
    );
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
}
