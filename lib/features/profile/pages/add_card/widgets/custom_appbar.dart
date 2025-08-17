import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  static final _textStyle = AppTextStyles.h3.copyWith(
    color: AppColors.primaryText,
  );

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
          const SizedBox(width: 4),
          Text('Назад', style: _textStyle),
        ],
      ),
    );
  }
}
