import 'package:inforcom/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:inforcom/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:inforcom/features/map/sheets/route_building/gas_station_item.dart';
import 'package:inforcom/features/map/sheets/route_building/selected_station_sheet.dart';

class GasStationList extends StatelessWidget {
  const GasStationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              AppBottomSheet.showBottomSheet(
                context,
                isKeyboardOnTop: true,
                child: const SelectedStationSheet(),
              );
            },
            child: GasStationItem(
              address: 'Котельническая наб., 1/15',
              city: 'Москва',
              distance: '21 км',
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(color: AppColors.lightGray),
    );
  }
}
