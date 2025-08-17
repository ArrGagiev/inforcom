import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key, this.onTap});

  final void Function()? onTap;

  static final _signOutStyle = AppTextStyles.body1.copyWith(
    color: AppColors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text('Выйти', style: _signOutStyle),
        ),
      ),
    );
  }
}
