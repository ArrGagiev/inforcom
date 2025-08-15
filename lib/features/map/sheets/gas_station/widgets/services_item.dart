import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppIcons.cup,
            colorFilter: ColorFilter.mode(AppColors.accent2, BlendMode.srcIn),
          ),
          Text(
            'Кафе',
            style: AppTextStyles.body2.copyWith(color: AppColors.accent2),
          ),
        ],
      ),
    );
  }
}
