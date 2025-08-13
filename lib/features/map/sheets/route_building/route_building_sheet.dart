import 'package:flutter/material.dart';
import 'package:inforcom/core/widgets/text_form/app_text_form.dart';
import 'package:inforcom/features/map/sheets/route_building/gas_station_list.dart';

class RouteBuildingSheet extends StatelessWidget {
  const RouteBuildingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        AppTextForm(labelText: '', showSearchIcon: true),
        const SizedBox(height: 16),
        Expanded(child: GasStationList()),
      ],
    );
  }
}
