import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/widgets.dart';

class CustomSkipWidget extends StatelessWidget {
  const CustomSkipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        AppStrings.skip,
        textAlign: TextAlign.end,
        style: Styles.poppins300style16.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
