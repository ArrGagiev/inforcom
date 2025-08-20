import 'package:flutter/material.dart';
import 'package:inforcom/features/map/my_map_page.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyMapPage();
  }
}

// Column(
    //   children: [
    //     SizedBox(height: 100),
    //     PrimaryButton(
    //       title: 'Фильтры',
    //       onPressed: () {
    //         AppBottomSheet.showBottomSheet(
    //           context,
    //           child: const FuelFiltersSheet(),
    //         );
    //       },
    //     ),
    //     SizedBox(height: 16),
    //     PrimaryButton(
    //       title: 'Построить маршрут',
    //       onPressed: () {
    //         AppBottomSheet.showBottomSheet(
    //           context,
    //           isKeyboardOnTop: true,
    //           child: const RouteBuildingSheet(),
    //         );
    //       },
    //     ),
    //     SizedBox(height: 16),
    //     PrimaryButton(
    //       title: 'Проложить маршрут',
    //       onPressed: () {
    //         AppBottomSheet.showBottomSheet(
    //           context,
    //           heightPercent: 0.42,
    //           useRootNavigator: false,
    //           isKeyboardOnTop: true,
    //           child: const SelectedStationSheet(),
    //         );
    //       },
    //     ),
    //     SizedBox(height: 16),
    //     PrimaryButton(
    //       title: 'Геолокация',
    //       onPressed: () {
    //         AppDialog.showCustomDialog(
    //           context: context,
    //           widthPercent: 0.8,
    //           child: GeolocationDialog(
    //             title: 'Настройка геолокации',
    //             text:
    //                 'Включите геолокацию в настройках. Вы сможете строить маршруты',
    //           ),
    //         );
    //       },
    //     ),
    //     SizedBox(height: 16),
    //     PrimaryButton(
    //       title: 'Карточка АЗС',
    //       onPressed: () {
    //         AppBottomSheet.showBottomSheet(
    //           context,
    //           heightPercent: 0.8,
    //           useRootNavigator: false,
    //           child: GasStationSheet(),
    //         );
    //       },
    //     ),
    //   ],
    // );