import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:dalel/core/routes/routes.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgetPasswordTextWidget extends StatelessWidget {
  const ForgetPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customReplacementNavigate(context, AppRouter.kforgetPassword);
      },
      child: Align(
        alignment: AlignmentGeometry.centerRight,
        child: Text(
          AppStrings.forgotPassword,
          style: Styles.poppins600style28.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
