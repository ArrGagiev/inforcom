import 'package:flutter/material.dart';
import 'package:inforcom/core/services/primary_bottom_sheet.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/features/map/widgets/filters/fuel_list_layout.dart';
import 'package:inforcom/features/profile/widgets/fuel_type_selector.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FuelTypeSelector(),
          const SizedBox(height: 16),
          PrimaryButton(
            title: "Фильтры",
            onPressed: () {
              PrimaryBottomSheet.show(context, child: FuelListLayout());
            },
          ),
        ],
      ),
    );
  }
}
