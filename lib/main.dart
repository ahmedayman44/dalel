import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Dalel());
}

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Image.asset(Assets.assetsImagesForgotPassword),
            Text(AppStrings.change),
          ],
        ),
      ),
    );
  }
}
