import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/features/splash/sheets/auth_sheet.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.pop(context);
        AppBottomSheet.showBottomSheet(
          context,
          heightPercent: 0.94,
          isKeyboardOnTop: true,
          useRootNavigator: false,
          child: AuthSheet(),
        );
      },
      child: SvgPicture.asset(
        width: 20,
        AppIcons.backArrow,
        colorFilter: ColorFilter.mode(AppColors.secondaryText, BlendMode.srcIn),
      ),
    );
  }
}
