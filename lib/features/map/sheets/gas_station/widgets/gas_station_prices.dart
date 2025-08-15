import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/features/map/sheets/gas_station/widgets/price_item.dart';

class GasStationPrices extends StatelessWidget {
  const GasStationPrices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Цены на топливо:', style: AppTextStyles.body2),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            PriceItem(title: '95', price: '86,49 ₽'),
            PriceItem(title: '95', price: '86,49 ₽'),
            PriceItem(title: '95', price: '86,49 ₽'),
          ],
        ),
      ],
    );
  }
}
