import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class GasStationItem extends StatelessWidget {
  const GasStationItem({
    super.key,
    required this.address,
    required this.city,
    required this.distance,
  });

  final String address;
  final String city;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SvgPicture.asset(
            AppIcons.location,
            colorFilter: ColorFilter.mode(AppColors.accent2, BlendMode.srcIn),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              address,
              style: AppTextStyles.body2.copyWith(color: AppColors.primaryText),
            ),
            Text(
              city,
              style: AppTextStyles.body3.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
        Expanded(
          child: Text(
            distance,
            style: AppTextStyles.body3.copyWith(color: AppColors.secondaryText),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
