import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/onboarding/presentation/widgets/custom_skip_.dart';
import 'package:dalel/features/onboarding/presentation/widgets/on_boarding_body_view.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 40),
              CustomSkipWidget(),
              OnBoaardingWidgetBody(),
              SizedBox(height: 88),
              CustomButton(textButton: AppStrings.next),
              SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
