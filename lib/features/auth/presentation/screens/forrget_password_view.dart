import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class ForrgetPasswordView extends StatelessWidget {
  const ForrgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 108)),
          SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.forgotPasswordPage),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 68)),
          SliverToBoxAdapter(
            child: Container(
              width: 188.77,
              height: 169.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.assetsImagesForgotPassword),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
