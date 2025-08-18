import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class SaleArea extends StatelessWidget {
  const SaleArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 30,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              width: 20,
              AppIcons.sale,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            const SizedBox(width: 4),
            Text(
              'Акция',
              style: AppTextStyles.title4.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
