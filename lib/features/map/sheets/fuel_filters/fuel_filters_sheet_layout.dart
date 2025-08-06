import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/features/map/sheets/fuel_filters/fuel_list_selector.dart';

class FuelFiltersSheetLayout extends StatelessWidget {
  const FuelFiltersSheetLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Фильтры', style: AppTextStyles.title1),
            TextButton(
              onPressed: () {
                // Здесь логика сброса фильтров
                // по типу
                // setState(() {
                //   selectedFuel.clear();
                // });
                // А пока что, просто закрываем BottomSheet
                Navigator.pop(context);
              },
              child: Text(
                'Сбросить',
                style: AppTextStyles.body2.copyWith(color: AppColors.accent2),
              ),
            ),
          ],
        ),
        const Expanded(child: FuelListSelector()),
      ],
    );
  }
}
