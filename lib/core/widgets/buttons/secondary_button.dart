import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    this.iconWidget,
    this.margin,
    this.onPressed,
  });

  final String title;
  final Widget? iconWidget;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            return states.contains(WidgetState.disabled)
                ? AppColors.secondaryText
                : AppColors.accent;
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            return states.contains(WidgetState.disabled)
                ? AppColors.lightGray
                : AppColors.secondary;
          }),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            return states.contains(WidgetState.pressed)
                ? AppColors.accent.withAlpha(50)
                : null;
          }),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(52)),
            ),
          ),
          minimumSize: WidgetStateProperty.all(
            Size(MediaQuery.of(context).size.width, 52),
          ),
          iconColor: WidgetStateProperty.resolveWith<Color>((states) {
            return states.contains(WidgetState.disabled)
                ? AppColors.lightGray
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
                ? AppTextStyles.body2
                : AppTextStyles.title2,
          ),
        ),
      ),
    );
  }
}
