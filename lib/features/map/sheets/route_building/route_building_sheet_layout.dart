import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/text_form/app_text_form.dart';

// TODO: повыносить виджеты отдельно
class RouteBuildingSheetLayout extends StatelessWidget {
  const RouteBuildingSheetLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        AppTextForm(
          labelText: 'Котельническая наб., 1/15',
          showSearchIcon: true,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(
                        AppIcons.location,
                        colorFilter: ColorFilter.mode(
                          AppColors.accent2,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Котельническая наб., 1/15',
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.primaryText,
                          ),
                        ),
                        Text(
                          'Москва',
                          style: AppTextStyles.body3.copyWith(
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '21.7 км',
                        style: AppTextStyles.body3.copyWith(
                          color: AppColors.secondaryText,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) =>
                const Divider(color: AppColors.lightGray),
          ),
        ),
      ],
    );
  }
}
