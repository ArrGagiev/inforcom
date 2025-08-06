import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/core/widgets/check_boxes/primary_check_box.dart';

class FuelItem {
  final String name;
  final bool selected;

  FuelItem({required this.name, required this.selected});

  factory FuelItem.fromJson(Map<String, dynamic> json) {
    return FuelItem(name: json['name'], selected: json['selected']);
  }
}

class FuelListSelector extends StatefulWidget {
  const FuelListSelector({super.key});

  @override
  State<FuelListSelector> createState() => _FuelListSelectorState();
}

class _FuelListSelectorState extends State<FuelListSelector> {
  List<FuelItem> fuelItems = [];
  List<String> selectedFuel = [];

  @override
  void initState() {
    super.initState();
    loadFuelItems();
  }

  void loadFuelItems() {
    final responseFromServer = [
      {"name": "АИ - 100", "selected": true},
      {"name": "АИ - 92", "selected": false},
      {"name": "АИ - 80", "selected": false},
      {"name": "АИ - 93", "selected": false},
      {"name": "АИ - 95", "selected": false},
      {"name": "АИ - 96", "selected": true},
      {"name": "СПГ (Метан)", "selected": false},
      {"name": "Газ (Пропан)", "selected": false},
      {"name": "КПГ", "selected": false},
      {"name": "ДТ зима", "selected": false},
      {"name": "ДТ лето", "selected": false},
      {"name": "ДТ ТУ", "selected": false},
      {"name": "ДТ евро", "selected": false},
    ];

    fuelItems = responseFromServer
        .map((json) => FuelItem.fromJson(json))
        .toList();

    selectedFuel = fuelItems
        .where((item) => item.selected)
        .map((item) => item.name)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: fuelItems.length,
              itemBuilder: (context, index) {
                final fuel = fuelItems[index];
                final isSelected = selectedFuel.contains(fuel.name);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedFuel.remove(fuel.name);
                      } else {
                        selectedFuel.add(fuel.name);
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            fuel.name,
                            style: AppTextStyles.body3,
                          ),
                        ),
                        PrimaryCheckbox<String>(
                          value: fuel.name,
                          groupValue: isSelected ? fuel.name : null,
                          onChanged: (value) {
                            setState(() {
                              if (value == null) {
                                selectedFuel.remove(fuel.name);
                              } else {
                                selectedFuel.add(value);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.lightGray),
            ),
          ),
          PrimaryButton(title: "Выбрать", onPressed: () {}),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
