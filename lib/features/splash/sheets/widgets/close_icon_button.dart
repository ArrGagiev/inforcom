import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';

class CloseIconButton extends StatelessWidget {
  const CloseIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => Navigator.pop(context),
      child: SvgPicture.asset(
        width: 20,
        AppIcons.close,
        colorFilter: ColorFilter.mode(AppColors.secondaryText, BlendMode.srcIn),
      ),
    );
  }
}
