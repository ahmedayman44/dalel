import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:dalel/core/routes/routes.dart';
import 'package:dalel/core/utils/app_constant.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/onboarding/data/model/on_boarding_model.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons({
    super.key,
    required this.currentIndex,
    required this.controller,
  });
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          CustomButton(
            textButton: AppStrings.createAccount,
            onPressed: () {
              customReplacementNavigate(context, AppRouter.ksignUp);
            },
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              customReplacementNavigate(context, AppRouter.ksignIn);
            },
            child: Text(
              AppStrings.loginNow,
              style: Styles.poppins300style16.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    } else {
      return CustomButton(
        textButton: AppStrings.next,
        onPressed: () {
          //! nextPage used to navagite between onboarding pages
          controller.nextPage(
            duration: AppConstant.navigateBetweenOnBoardingPages,
            curve: Curves.bounceIn,
          );
        },
      );
    }
  }
}
