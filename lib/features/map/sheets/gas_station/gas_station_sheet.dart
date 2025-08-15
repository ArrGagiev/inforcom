import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/features/map/sheets/gas_station/widgets/gas_station_header.dart';
import 'package:inforcom/features/map/sheets/gas_station/widgets/gas_station_prices.dart';
import 'package:inforcom/features/map/sheets/gas_station/widgets/gas_station_promo.dart';
import 'package:inforcom/features/map/sheets/gas_station/widgets/gas_station_services.dart';

class GasStationSheet extends StatelessWidget {
  const GasStationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GasStationHeader(),
            _divider,
            GasStationPrices(),
            _divider,
            GasStationServices(),
            _divider,
            GasStationPromo(),
            _divider,
            PrimaryButton(title: 'Маршрут на АЗС', onPressed: () {}),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

const _divider = Padding(
  padding: EdgeInsets.symmetric(vertical: 16),
  child: Divider(color: AppColors.blueLine),
);
