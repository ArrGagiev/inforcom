import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/buttons/text_button.dart';

class GeolocationDialog extends StatelessWidget {
  const GeolocationDialog({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: AppTextStyles.h3.copyWith(color: AppColors.primaryText),
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: AppTextStyles.body3.copyWith(color: AppColors.secondaryText),
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(child: SizedBox()),
              SizedBox(
                width: 110,
                child: PrimaryTextButton(
                  title: 'Отменить',
                  accent2: true,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(
                width: 110,
                child: PrimaryTextButton(title: 'Включить', onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
