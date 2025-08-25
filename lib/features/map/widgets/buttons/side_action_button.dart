import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';

class SideActionButton extends StatelessWidget {
  const SideActionButton({super.key, required this.iconName, this.onPressed});
  final String iconName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: AppColors.primary,
      onPressed: onPressed,
      child: SvgPicture.asset(iconName),
    );
  }
}
