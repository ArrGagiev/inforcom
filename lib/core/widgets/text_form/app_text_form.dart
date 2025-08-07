import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/services/mask_formatter.dart';

enum ValidationType { number, email, minSymbols }

class AppTextForm extends StatelessWidget {
  const AppTextForm({
    super.key,
    this.type,
    required this.labelText,
    required this.controller,
    this.enabled = true,
    required this.showErrorIcon, // Управляется из BLoC
    required this.showSearchIcon, // Управляется из BLoC
    this.hasError = false, // Флаг ошибки из BLoC
  });

  final ValidationType? type;
  final String labelText;
  final TextEditingController? controller;
  final bool enabled;
  final bool showErrorIcon;
  final bool showSearchIcon;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      inputFormatters: type == ValidationType.number
          ? [MaskFormatter.appMaskFormatter]
          : null,
      controller: controller,
      keyboardType: type == ValidationType.number ? TextInputType.phone : null,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: AppTextStyles.body2,
      decoration: _buildDecoration(context),
      onChanged: (text) {
        // context.read<YourFormBloc>().add(TextFieldChanged(
        //   text: text,
        //   fieldType: type,
        // ));
      },
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    final borderColor = hasError
        ? AppColors.red
        : enabled == false
        ? Colors.transparent
        : AppColors.lightGray;

    final focusedBorderColor = hasError ? AppColors.red : AppColors.accent2;

    return InputDecoration(
      errorText: hasError ? 'Supporting text' : null, //!
      errorStyle: AppTextStyles.body3.copyWith(color: AppColors.red),
      contentPadding: const EdgeInsets.all(16),
      isCollapsed: true,
      filled: true,
      fillColor: enabled == false ? AppColors.lightGray : AppColors.primary,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: labelText,
      labelStyle: TextStyle(
        color: enabled == false ? AppColors.secondaryText : AppColors.lightGray,
      ),

      // Иконка поиска
      prefixIcon: showSearchIcon
          ? Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: SvgPicture.asset(
                AppIcons.search,
                colorFilter: ColorFilter.mode(
                  hasError
                      ? AppColors.red
                      : enabled == false
                      ? AppColors.secondaryText
                      : AppColors.iconsBase,
                  BlendMode.srcIn,
                ),
              ),
            )
          : null,

      // Иконка ошибки
      suffixIcon: showErrorIcon
          ? Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                AppIcons.info,
                colorFilter: ColorFilter.mode(
                  enabled ? AppColors.lightGray : AppColors.secondaryText,
                  BlendMode.srcIn,
                ),
              ),
            )
          : null,

      suffixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      prefixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),

      // Бордеры с учетом ошибки и состояния
      border: _otlineBorder(color: borderColor),
      enabledBorder: _otlineBorder(color: borderColor),
      focusedBorder: _otlineBorder(color: focusedBorderColor),
      errorBorder: _otlineBorder(color: AppColors.red),
      disabledBorder: _otlineBorder(color: Colors.transparent),
    );
  }
}

OutlineInputBorder _otlineBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(52)),
  );
}
