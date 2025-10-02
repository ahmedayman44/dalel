import 'package:dalel/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndictor extends StatelessWidget {
  const CustomSmoothPageIndictor({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColor.deepBrown,
        dotHeight: 7,
        dotWidth: 10,
      ),
    );
  }
}
