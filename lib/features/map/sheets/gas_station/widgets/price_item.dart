import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class PriceItem extends StatelessWidget {
  const PriceItem({super.key, required this.title, required this.price});

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      height: 64,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: EdgeInsets.all(1), // Отступ 1px для уменьшения размера
          child: ClipPath(
            clipper: _CustomCornerClipper(), // Кастомный clipper для среза угла
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ), // Закругления на 1px меньше
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body3.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                  Text(
                    price,
                    style: AppTextStyles.title3.copyWith(
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width - 20, 0); // Срез справа вверху
    path.lineTo(size.width, 15); // Срез справа внизу
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
