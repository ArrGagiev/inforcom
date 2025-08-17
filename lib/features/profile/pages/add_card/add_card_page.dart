import 'package:flutter/material.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/features/profile/pages/add_card/widgets/custom_appbar.dart';
import 'package:inforcom/features/profile/pages/add_card/widgets/new_card_area.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomAppBar(),
            const SizedBox(height: 16),
            NewCardArea(),
            const SizedBox(height: 16),
            PrimaryButton(title: 'Проверить', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
