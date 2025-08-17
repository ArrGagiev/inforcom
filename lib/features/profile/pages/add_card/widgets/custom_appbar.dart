import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.isSignedIn = false});

  final bool isSignedIn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 200,
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.backArrow),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
          ),
          const SizedBox(width: 4), // Нужное вам расстояние
          Text(
            'Назад',
            style: AppTextStyles.h3.copyWith(color: AppColors.primaryText),
          ),
        ],
      ),
      actions: [
        if (isSignedIn)
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  'Выйти',
                  style: AppTextStyles.body1.copyWith(color: AppColors.red),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
