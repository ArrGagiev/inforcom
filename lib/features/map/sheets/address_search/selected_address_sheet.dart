import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/features/map/sheets/gas_station/gas_station_sheet.dart';

// TODO: пока еще не подкючен!
class SelectedAddressSheet extends StatelessWidget {
  const SelectedAddressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text('Котельническая наб., 1/15', style: AppTextStyles.body1),
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
        SizedBox(height: 24),
        PrimaryButton(
          title: 'Проложить маршрут',
          onPressed: () {
            Navigator.pop(context);
            AppBottomSheet.showBottomSheet(
              context,
              isKeyboardOnTop: true,
              child: const GasStationSheet(),
            );
          },
        ),
      ],
    );
  }
}
