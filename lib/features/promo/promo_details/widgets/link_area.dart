import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class LinkArea extends StatelessWidget {
  const LinkArea({
    super.key,
    required this.icon,
    required this.text,
    this.color,
  });

  final String icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 52,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(52),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  width: 20,
                  icon,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: FittedBox(
                    child: Text(
                      text,
                      style: AppTextStyles.title4.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
