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
              controller: null,
              showErrorIcon: false,
              showSearchIcon: true,
              hasError: true,
              type: ValidationType.number,
            ),
            const SizedBox(height: 16),
            AppTextForm(
              labelText: 'Что-то там2',
              controller: null,
              showErrorIcon: false,
              showSearchIcon: false,
            ),
            const SizedBox(height: 16),
            AppTextForm(
              labelText: 'Что-то там',
              controller: null,
              showErrorIcon: true,
              showSearchIcon: false,
            ),
            const SizedBox(height: 16),
            AppTextForm(
              labelText: 'Что-то там',
              controller: null,
              enabled: false,
              showErrorIcon: true,
              showSearchIcon: true,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
