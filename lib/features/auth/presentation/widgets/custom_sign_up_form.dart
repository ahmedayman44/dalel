import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSucess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("sucess")));
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },

      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpFormKey,
          autovalidateMode: authCubit.signUpAutovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 16),
              CustomTextFormField(
                labelText: AppStrings.fristName,
                // suffixIcon: Icon(Icons.person),
                onChanged: (fristName) {
                  authCubit.fristName = fristName;
                },
              ),
              CustomTextFormField(
                // suffixIcon: Icon(Icons.person),
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              TermsAndConditions(),
              SizedBox(height: 88),
              CustomButton(
                color:
                    authCubit.termsAndConditionCheckBoxValue == false
                        ? AppColor.grey
                        : null,
                onPressed: () {
                  if (authCubit.termsAndConditionCheckBoxValue == true) {
                    if (authCubit.signUpFormKey.currentState!.validate()) {
                      authCubit.signUpCreateUserWithEmailAndPassword();
                    }
                  }
                },
                textButton: AppStrings.signUp,
              ),
            ],
          ),
        );
      },
    );
  }
}
