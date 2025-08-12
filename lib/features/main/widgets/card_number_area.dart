import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class CardNumberArea extends StatelessWidget {
  const CardNumberArea({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(4),
          // TODO: учитывая не широкие размеры экранов могу перестроить под Flex
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppIcons.profile, width: 21),
              const SizedBox(width: 8),
              Text(
                '1234 1234 1234 1234',
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.accent,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.accent,
                  // decorationThickness: 1,
                ),
              ),
              Expanded(
                child: Text(
                  'Низкий баланс',
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.primaryText,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
