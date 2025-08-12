import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class PromoTitleArea extends StatelessWidget {
  const PromoTitleArea({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTextStyles.h3.copyWith(color: AppColors.primaryText);

    final buttonStyle = AppTextStyles.body1.copyWith(
      color: AppColors.secondaryText,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Наши акции', style: titleStyle),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text('Посмотреть все', style: buttonStyle),
            ),
          ),
        ],
      ),
    );
  }
}
