import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    required this.textButton,
    this.onPressed,
  });
  final Color? color;
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          textButton,
          style: Styles.poppins500style24.copyWith(
            fontSize: 18,
            color: AppColor.offWhite,
          ),
          // style:  TextStyle(color: AppColor.offWhite ),
        ),
      ),
    );
  }
}
