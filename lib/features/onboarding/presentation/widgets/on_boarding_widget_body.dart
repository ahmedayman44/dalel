import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/features/onboarding/data/model/on_boarding_model.dart';
import 'package:dalel/features/onboarding/presentation/widgets/custom_smooth_indictor.dart';
import 'package:flutter/material.dart';

class OnBoaardingWidgetBody extends StatelessWidget {
  const OnBoaardingWidgetBody({
    super.key,
    required this.controller,
    this.onPageChanged,
  });
  final PageController controller;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: controller,
        itemCount: onBoardingData.length,

        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 290,
                width: 343,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onBoardingData[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 24),
              CustomSmoothPageIndictor(controller: controller),
              SizedBox(height: 32),
              Text(
                onBoardingData[index].title,
                style: Styles.poppins500style24,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 16),
              Text(
                onBoardingData[index].subTitle,
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
