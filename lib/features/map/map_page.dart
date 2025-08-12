import 'package:flutter/material.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/features/map/sheets/fuel_filters/fuel_filters_sheet_layout.dart';
import 'package:inforcom/features/map/sheets/route_building/route_building_sheet_layout.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        PrimaryButton(
          title: 'Фильтры',
          onPressed: () {
            AppBottomSheet.show(context, child: const FuelFiltersSheetLayout());
          },
        ),
        SizedBox(height: 16),
        PrimaryButton(
          title: 'Построить маршрут',
          onPressed: () {
            AppBottomSheet.show(
              context,
              isKeyboardOnTop: true,
              child: const RouteBuildingSheetLayout(),
            );
          },
        ),
      ],
    );
  }
}
