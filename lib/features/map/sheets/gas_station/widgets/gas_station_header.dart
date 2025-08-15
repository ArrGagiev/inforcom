import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class GasStationHeader extends StatelessWidget {
  const GasStationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset(
                width: 50,
                AppIcons.info,
                colorFilter: ColorFilter.mode(
                  AppColors.accent2,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('АЗС «Газпромнефть»', style: AppTextStyles.title1),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(
                        AppIcons.car,
                        colorFilter: ColorFilter.mode(
                          AppColors.secondaryText,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Text(
                      '1 час 32 минуты',
                      style: AppTextStyles.title3.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '21.7 км',
                      style: AppTextStyles.body2.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
