import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';

class MapButton extends StatelessWidget {
  const MapButton({super.key, required this.onPressed, required this.icon});

  final void Function()? onPressed;
  final String icon;

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
