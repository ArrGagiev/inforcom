import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/features/map/sheets/gas_station/widgets/services_item.dart';

class GasStationServices extends StatelessWidget {
  const GasStationServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Сервисы на АЗС:', style: AppTextStyles.body2),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [ServicesItem(), ServicesItem()],
        ),
      ],
    );
  }
}
