import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckBooks extends StatefulWidget {
  const CustomCheckBooks({super.key});

  @override
  State<CustomCheckBooks> createState() => _CustomCheckBooksState();
}

class _CustomCheckBooksState extends State<CustomCheckBooks> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(color: AppColor.grey),
      onChanged: (newValue) {
        setState(() {
          value = newValue!;
          BlocProvider.of<AuthCubit>(
            context,
          ).updateTermsAndConditionCheckBoxValue(newValue: newValue);
        });
      },
    );
  }
}
