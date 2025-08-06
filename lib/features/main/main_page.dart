import 'package:flutter/material.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/core/widgets/text_form/app_text_form.dart';
import 'package:inforcom/features/map/sheets/fuel_filters/fuel_filters_sheet_layout.dart';
import 'package:inforcom/features/profile/widgets/fuel_type_selector.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextForm(labelText: 'Номер телефона', controller: null),
          // TextFormField(),
          const SizedBox(height: 16),
          FuelTypeSelector(),
          const SizedBox(height: 16),
          PrimaryButton(
            title: "Фильтры",
            onPressed: () {
              AppBottomSheet.show(context, child: FuelFiltersSheetLayout());
            },
          ),
        ],
      ),
    );
  }
}
