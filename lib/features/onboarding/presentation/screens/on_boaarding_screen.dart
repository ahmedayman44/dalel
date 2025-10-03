import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:dalel/core/routes/routes.dart';
import 'package:dalel/core/services/servece_locator.dart';
import 'package:dalel/features/onboarding/presentation/widgets/custom_nav_bar.dart';
import 'package:dalel/features/onboarding/presentation/widgets/get_buttons.dart';
import 'package:dalel/features/onboarding/presentation/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
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
              CustomNavBar(
                onTap: () {
                  customReplacementNavigate(context, AppRouter.ksignUp);
                  getIt<CacheHelper>().saveData(
                    key: "OnBoardingVisited",
                    value: true,
                  );
                },
              ),
              OnBoaardingWidgetBody(
                controller: _controller,
                //! we used onPageChanged function when page change it work update
                //! we should do it before check this  currentIndex == onBoardingData.length - 1 to do rebuild
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),

              SecondPage(currentIndex: currentIndex, controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
    required this.currentIndex,
    required this.controller,
  });
  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 88),
        GetButtons(currentIndex: currentIndex, controller: controller),
        SizedBox(height: 17),
      ],
    );
  }
}
