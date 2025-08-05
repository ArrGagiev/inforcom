import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/widgets/buttons/destructive_button.dart';
import 'package:inforcom/core/widgets/buttons/outline_button.dart';
import 'package:inforcom/core/widgets/buttons/primary_button.dart';
import 'package:inforcom/core/widgets/buttons/secondary_button.dart';
import 'package:inforcom/core/widgets/buttons/text_button.dart';
import 'package:inforcom/core/widgets/buttons/underline_text_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
            margin: EdgeInsets.symmetric(horizontal: 20),
            title: 'Кнопка',
            onPressed: () {},
          ),
          SizedBox(height: 20),
          SecondaryButton(
            margin: EdgeInsets.symmetric(horizontal: 20),
            title: 'Кнопка 2',
            onPressed: () {},
          ),
          SizedBox(height: 20),
          PrimaryButton(
            margin: EdgeInsets.symmetric(horizontal: 20),
            title: 'Кнопка с загрузкой',
            onPressed: () {},
            iconWidget: CircularProgressIndicator(color: AppColors.primary),
          ),
          SizedBox(height: 20),
          PrimaryButton(
            margin: EdgeInsets.symmetric(horizontal: 20),
            title: 'Кнопка 3',
            // onPressed: () {},
          ),
          SizedBox(height: 20),
          OutlineButton(
            margin: EdgeInsets.symmetric(horizontal: 20),
            title: 'Кнопка 4',
            onPressed: () {},
          ),
          SizedBox(height: 20),
          DestructiveButton(
            margin: EdgeInsets.symmetric(horizontal: 20),
            title: 'Кнопка 5',
            onPressed: () {},
          ),
          SizedBox(height: 20),
          PrimaryTextButton(
            margin: EdgeInsets.symmetric(horizontal: 20),
            title: 'Кнопка 6',
            onPressed: () {},
          ),
          SizedBox(height: 20),
          UnderlinedTextButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            text: 'Кнопка 6',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
