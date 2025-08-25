import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.icon, required this.onPressed});

  final String icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        width: 24,
        colorFilter: ColorFilter.mode(AppColors.iconsBase, BlendMode.srcIn),
      ),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(64, 44),
        maximumSize: const Size(64, 44),
        fixedSize: const Size(64, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(64),
          side: BorderSide(color: AppColors.lightGray),
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
