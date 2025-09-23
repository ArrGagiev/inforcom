import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';

class SelectedAddressSheet extends StatelessWidget {
  final String address;
  final String duration;
  final String distance;
  final VoidCallback onBuildRoute;

  const SelectedAddressSheet({
    super.key,
    required this.address,
    required this.duration,
    required this.distance,
    required this.onBuildRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address, style: AppTextStyles.h2),
                  const SizedBox(height: 8),
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
                        duration,
                        style: AppTextStyles.title3.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '·  $distance',
                        style: AppTextStyles.body2.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                width: 20,
                AppIcons.close,
                colorFilter: ColorFilter.mode(
                  AppColors.secondaryText,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          title: 'Проложить маршрут',
          onPressed: () {
            Navigator.pop(context);
            onBuildRoute();
          },
        ),
      ],
    );
  }
}
