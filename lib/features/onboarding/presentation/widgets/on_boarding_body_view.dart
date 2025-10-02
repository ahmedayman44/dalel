import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/features/onboarding/presentation/widgets/custom_smooth_indictor.dart';
import 'package:flutter/material.dart';

class OnBoaardingWidgetBody extends StatelessWidget {
  OnBoaardingWidgetBody({super.key});
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(Assets.assetsImagesOnBoarding),
              SizedBox(height: 24),
              CustomSmoothPageIndictor(controller: _controller),
              SizedBox(height: 32),
              Text(
                "Explore The History With Dalel in a smart way",
                style: Styles.poppins500style24,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Explore The History With Dalel in a smart way",
                style: Styles.poppins300style16,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
