import 'package:flutter/material.dart';
import 'package:inforcom/core/widgets/check_boxes/fuel_list_selector.dart';
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
          FuelListSelector(),
        ],
      ),
    );
  }
}
