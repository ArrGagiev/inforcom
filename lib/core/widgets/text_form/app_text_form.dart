import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/services/mask_formatter.dart';

enum ValidationType { phoneNumber, cardNumber, cardCode }

class AppTextForm extends StatelessWidget {
  const AppTextForm({
    super.key,
    required this.labelText,
    this.type,
    this.controller,
    this.enabled = true,
    this.validator,
    //-----------------------------┐
    // Для управления из BLoC
    this.showInfoIcon = false,
    this.showSearchIcon = false,
    this.hasError = false,
    //-----------------------------┘
  });

  final ValidationType? type;
  final String labelText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool showInfoIcon;
  final bool showSearchIcon;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      inputFormatters: _getInputFormatters(),
      controller: controller,
      keyboardType: _getKeyboardType(),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: AppTextStyles.body2,
      decoration: _buildDecoration(context),
      validator: validator,
      // onChanged: (text) {
      //   log(text);
      // },
    );
  }

  List<TextInputFormatter>? _getInputFormatters() {
    switch (type) {
      case ValidationType.phoneNumber:
        return [MaskFormatter.phoneNumber];
      case ValidationType.cardNumber:
        return [MaskFormatter.cardNumber];
      default:
        return null;
    }
  }

  TextInputType? _getKeyboardType() {
    switch (type) {
      case ValidationType.phoneNumber:
        return TextInputType.phone;
      case ValidationType.cardNumber:
      case ValidationType.cardCode:
        return TextInputType.number;
      default:
        return null;
    }
  }

  InputDecoration _buildDecoration(BuildContext context) {
    final fillColor = enabled ? AppColors.primary : AppColors.lightGray;

    final focusedBorderColor = hasError ? AppColors.red : AppColors.accent2;

    final suffixIconColor = enabled
        ? AppColors.lightGray
        : AppColors.secondaryText;

    final borderColor = hasError
        ? AppColors.red
        : enabled == false
        ? Colors.transparent
        : AppColors.lightGray;

    final prefixIconColor = hasError
        ? AppColors.red
        : enabled == false
        ? AppColors.secondaryText
        : AppColors.iconsBase;

    final labelTextStyleColor = enabled
        ? AppColors.lightGray
        : AppColors.secondaryText;

    return InputDecoration(
      // TODO: Текст ошибки допишу в зависимости от работы API
      errorText: hasError ? 'Something went wrong' : null,
      errorStyle: AppTextStyles.body3.copyWith(color: AppColors.red),
      contentPadding: const EdgeInsets.all(14),
      isCollapsed: true,
      filled: true,
      fillColor: fillColor,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: labelText,
      labelStyle: TextStyle(color: labelTextStyleColor),

      prefixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      suffixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      prefixIcon: _buildSearchIcon(prefixIconColor),
      suffixIcon: _buildInfoIcon(suffixIconColor),

      border: _outlineBorder(color: borderColor),
      enabledBorder: _outlineBorder(color: borderColor),
      focusedBorder: _outlineBorder(color: focusedBorderColor),
      errorBorder: _outlineBorder(color: AppColors.red),
      disabledBorder: _outlineBorder(color: Colors.transparent),
    );
  }

  // Иконка поиска
  Widget? _buildSearchIcon(Color color) {
    if (!showSearchIcon) return null;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 10),
      child: SvgPicture.asset(
        AppIcons.search,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }

  // Иконка информации
  Widget? _buildInfoIcon(Color color) {
    if (!showInfoIcon) return null;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SvgPicture.asset(
        AppIcons.info,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }

  // Бордер
  OutlineInputBorder _outlineBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(52)),
    );
  }
}
