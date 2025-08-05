import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class UnderlinedTextButton extends StatelessWidget {
  const UnderlinedTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.underlineColor,
    this.padding,
    this.textStyle,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? color; // Цвет текста
  final Color? underlineColor; // Цвет подчеркивания
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final defaultTextColor = color ?? AppColors.accent;
    final defaultUnderlineColor = underlineColor ?? defaultTextColor;

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.disabled)
              ? AppColors.secondaryText
              : defaultTextColor;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          return states.contains(WidgetState.pressed)
              ? defaultTextColor.withAlpha(10)
              : null;
        }),
        padding: WidgetStateProperty.all(padding ?? EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStateProperty.all(const RoundedRectangleBorder()),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: onPressed == null
                  ? AppColors.secondaryText
                  : defaultUnderlineColor,
              width: 1.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 4,
          ), // Отступ между текстом и линией
          child: Text(
            text,
            style: (textStyle ?? AppTextStyles.body2).copyWith(
              color: onPressed == null
                  ? AppColors.secondaryText
                  : defaultTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
