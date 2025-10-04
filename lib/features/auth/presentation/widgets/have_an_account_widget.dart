import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: text1, style: Styles.poppins400style12),
              TextSpan(
                text: text2,
                style: Styles.poppins400style12.copyWith(
                  color: AppColor.lightGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
