
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/services/mask_formatter.dart';

enum ValidationType {
  number,
  email,
  min3Chars,
}

class AppTextForm extends StatefulWidget {
  const AppTextForm({
    super.key,
    this.type,
    this.maxLines,
    required this.labelText,
    required this.controller,
    this.onValidation,
  });

  final ValidationType? type;
  final int? maxLines;
  final String labelText;
  final TextEditingController? controller;
  final bool Function(bool isValid)? onValidation;

  @override
  State<AppTextForm> createState() => _AppTextFormState();
}

class _AppTextFormState extends State<AppTextForm> {
  final _formKey = GlobalKey<FormState>();
  bool _showErrorIcon = false; //для отображения иконки ошибки
  bool _isValid = false; //для отображения валидации

  void _onSubmit() {
    _formKey.currentState!.validate();
  }

  // @override
  // void dispose() {
  //   widget.controller.dispose();
  //   super.dispose();
  // }

  String? _validateInput(String? value) {
    if (value != null) {
      switch (widget.type) {
        case ValidationType.number:
          final unmaskedText = MaskFormatter.appMaskFormatter.unmaskText(value);
          if (!RegExp(r"^\+?\d{10,13}$").hasMatch(unmaskedText)) {
            _showErrorIcon = true;
            _isValid = false;
            widget.onValidation!(_isValid);
            return 'Некорректный номер телефона';
          }
          break;
        case ValidationType.email:
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
              .hasMatch(value)) {
            _showErrorIcon = true;
            _isValid = false;
            widget.onValidation!(_isValid);
            return 'Некорректный email';
          }
          break;
        case ValidationType.min3Chars:
          if (value.length < 3) {
            _showErrorIcon = true;
            _isValid = false;
            widget.onValidation!(_isValid);
            return 'Введите не менее 3 символов';
          }
          break;
        default:
          return null;
      }
    }
    _showErrorIcon = false;
    widget.onValidation!(_isValid = true);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        inputFormatters:
            ValidationType.number == widget.type ? [MaskFormatter.appMaskFormatter] : null,
        controller: widget.controller,
        maxLines: widget.maxLines,
        keyboardType: ValidationType.number == widget.type ? TextInputType.number : null,
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        // вводимый текст
        style: AppTextStyles.body1, //todo: меняется вместе с темой <---
        decoration: inputDecoration.copyWith(
          labelText: widget.labelText,
          suffixIcon: _showErrorIcon
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset('assets/icons/error_icon.svg'),
                )
              : null,
        ),
        //----------------------------------------------------------------------
        validator: _validateInput,
        onChanged: (text) => setState(() {
          _onSubmit();
        }),
        //----------------------------------------------------------------------
      ),
    );
  }
}

OutlineInputBorder _otlineBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(16)),
  );
}

final inputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(16),
  // бордеры
  border: _otlineBorder(color: AppColors.lightGray),
  errorBorder: _otlineBorder(color: AppColors.red),
  enabledBorder: _otlineBorder(color: AppColors.accent2),
  focusedBorder: _otlineBorder(color: AppColors.accent2),
  disabledBorder: _otlineBorder(color: AppColors.lightGray),
  // текст плавающего заголовка ---------------------------------------------------
  alignLabelWithHint: false, //никогда не наверху
  // floatingLabelBehavior: FloatingLabelBehavior.auto,
  // labelStyle: AppTypography.bodyLarge.copyWith(color: AppColors.gray),
  // floatingLabelStyle: AppTypography.bodySmall.copyWith(color: AppColors.gray),
  // ------------------------------------------------------------------------------
  errorStyle: AppTextStyles.title3.copyWith(color: AppColors.red),
  suffixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
);