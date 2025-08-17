import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/radio_buttons/primary_radio_button.dart';

class FuelType {
  final String name;
  final bool selected;

  FuelType({required this.name, required this.selected});

  factory FuelType.fromJson(Map<String, dynamic> json) {
    return FuelType(name: json['name'], selected: json['selected']);
  }
}

class FuelTypeSelector extends StatefulWidget {
  const FuelTypeSelector({super.key});

  @override
  State<FuelTypeSelector> createState() => _FuelTypeSelectorState();
}

class _FuelTypeSelectorState extends State<FuelTypeSelector> {
  List<FuelType> fuelTypes = [];
  String? selectedFuel;

  @override
  void initState() {
    super.initState();
    loadFuelTypes();
  }

  void loadFuelTypes() {
    final responseFromServer = [
      {"name": "ДТ", "selected": true},
      {"name": "92", "selected": false},
      {"name": "95", "selected": false},
      {"name": "98", "selected": false},
      {"name": "Газ", "selected": false},
    ];

    fuelTypes = responseFromServer
        .map((json) => FuelType.fromJson(json))
        .toList();

    final initiallySelected = fuelTypes.firstWhere(
      (f) => f.selected,
      orElse: () => fuelTypes.first,
    );

    selectedFuel = initiallySelected.name;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: fuelTypes.map((fuel) {
              final isSelected = selectedFuel == fuel.name;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    setState(() {
                      selectedFuel = fuel.name;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        fuel.name,
                        style: AppTextStyles.title1.copyWith(
                          color: isSelected
                              ? AppColors.accent
                              : AppColors.primaryText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      PrimaryRadioButton<String>(
                        value: fuel.name,
                        groupValue: selectedFuel,
                        onChanged: (value) {
                          setState(() {
                            selectedFuel = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
