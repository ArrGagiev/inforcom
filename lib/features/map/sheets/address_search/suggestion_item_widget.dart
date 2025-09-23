import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:yandex_maps_mapkit/search.dart';

class SuggestionItemWidget extends StatelessWidget {
  final SuggestItem suggestion;
  final VoidCallback onTap;

  const SuggestionItemWidget({
    super.key,
    required this.suggestion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final title = suggestion.title.text;
    final subtitle = suggestion.subtitle?.text;
    final distance = suggestion.distance?.value;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.primaryText,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (distance != null)
              Text(
                '${(distance / 1000).toStringAsFixed(1)} км',
                style: AppTextStyles.body3.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
