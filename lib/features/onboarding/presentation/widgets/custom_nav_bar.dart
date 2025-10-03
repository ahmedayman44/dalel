import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/widgets.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          AppStrings.skip,
          textAlign: TextAlign.end,
          style: Styles.poppins300style16.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
