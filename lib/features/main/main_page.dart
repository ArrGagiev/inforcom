import 'package:flutter/material.dart';
import 'package:inforcom/core/widgets/text_form/app_text_form.dart';

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
            AppTextForm(
              labelText: 'Номер телефона',
              showInfoIcon: false,
              showSearchIcon: true,
              hasError: true,
              type: ValidationType.number,
            ),
            const SizedBox(height: 16),
            AppTextForm(
              labelText: 'Что-то там2',
              showInfoIcon: false,
              showSearchIcon: false,
            ),
            const SizedBox(height: 16),
            AppTextForm(
              labelText: 'Что-то там',
              showInfoIcon: true,
              showSearchIcon: false,
            ),
            const SizedBox(height: 16),
            AppTextForm(
              labelText: 'Что-то там',
              enabled: false,
              showInfoIcon: true,
              showSearchIcon: true,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
