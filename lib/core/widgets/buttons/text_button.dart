import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    super.key,
    required this.title,
    this.iconWidget,
    this.margin,
    this.onPressed,
    this.accent2 = false,
  });

  final String title;
  final Widget? iconWidget;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;
  final bool accent2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            return states.contains(WidgetState.disabled)
                ? AppColors.secondaryText
                : accent2
                ? AppColors.accent2
                : AppColors.accent;
          }),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            return states.contains(WidgetState.pressed)
                ? accent2
                      ? AppColors.accent2.withAlpha(20)
                      : AppColors.accent.withAlpha(20)
                : null;
          }),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(52)),
            ),
          ),

          minimumSize: WidgetStateProperty.all(
            Size(MediaQuery.of(context).size.width, 40),
          ),

          iconColor: WidgetStateProperty.resolveWith<Color>((states) {
            return states.contains(WidgetState.disabled)
                ? AppColors.secondaryText
                : AppColors.primary;
          }),
        ),
        icon: iconWidget != null
            ? SizedBox(width: 22, height: 22, child: iconWidget)
            : const SizedBox(),
        label: Padding(
          padding: EdgeInsets.only(left: iconWidget != null ? 8 : 0),
          child: Text(
            title,
            style: onPressed == null
                ? AppTextStyles.title4
                : AppTextStyles.title4,
          ),
        ),
      ),
    );
  }
}
