import 'package:flutter/material.dart';
import 'package:inforcom/core/widgets/pin_code_field/pin_code_field_2.dart';
import 'package:inforcom/core/widgets/pin_code_field/pin_code_field.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinCodeField(length: 4),
            PinCodeField2(lenght: 4, correctPin: "1111"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
