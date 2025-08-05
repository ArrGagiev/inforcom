import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class DestructiveButton extends StatelessWidget {
  const DestructiveButton({
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
                : AppColors.red;
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.transparent;
            }
            return Colors.transparent;
          }),
          side: WidgetStateProperty.resolveWith<BorderSide?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return const BorderSide(color: AppColors.lightGray);
            } else {
              return const BorderSide(color: AppColors.red);
            }
          }),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            return states.contains(WidgetState.pressed)
                ? AppColors.red.withAlpha(20)
                : null;
          }),
          elevation: WidgetStateProperty.all(0),
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
          child: Text(title, style: AppTextStyles.title2),
        ),
      ),
    );
  }
}
