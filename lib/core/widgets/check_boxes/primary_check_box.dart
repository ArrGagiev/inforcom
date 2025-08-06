import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';

class PrimaryCheckbox<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  const PrimaryCheckbox({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value == groupValue,
      onChanged: (bool? newValue) {
        if (newValue != null && newValue) {
          onChanged(value);
        } else {
          onChanged(null);
        }
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.accent;
        }
        return AppColors.primary;
      }),
      side: const BorderSide(
        color: AppColors.secondaryText,
        width: 2,
      ),
    );
  }
}
