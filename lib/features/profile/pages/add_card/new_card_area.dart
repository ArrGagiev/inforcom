import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/text_form/app_text_form.dart';

class NewCardArea extends StatelessWidget {
  const NewCardArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Новая карта', style: AppTextStyles.h3),
                  Image.asset(AppImages.simpleLogo, width: 34),
                ],
              ),
              Text(
                'Введите номер и пин-код вашей карты.',
                style: AppTextStyles.body2,
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Номер карты',
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ),
                        AppTextForm(labelText: 'XXXX XXXX XXXX XXXX'),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Код',
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ),
                        AppTextForm(labelText: 'XXXX'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                      AppIcons.info,
                      colorFilter: ColorFilter.mode(
                        AppColors.accent2,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Ваши данные по текущей карте будут удалены',
                      style: AppTextStyles.body2.copyWith(
                        color: AppColors.accent2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Decoration decoration = BoxDecoration(
  color: AppColors.primary,
  borderRadius: BorderRadius.circular(12),
  border: Border.all(color: AppColors.lightGray),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withAlpha(40),
      blurRadius: 5,
      spreadRadius: 1,
      offset: const Offset(0, 2),
    ),
  ],
);
