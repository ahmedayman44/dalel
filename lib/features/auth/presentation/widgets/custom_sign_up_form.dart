import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/routes/routes.dart';
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
          showToast("Sucessfully ,Check Your Email To Veify Your Account ");
          // ScaffoldMessenger.of(
          //   context,
          // ).showSnackBar(SnackBar(content: Text("Congratolation New Account")));
          customReplacementNavigate(context, AppRouter.ksignIn);
        } else if (state is SignUpFailure) {
          showToast(state.errMessage);
          // ScaffoldMessenger.of(
          //   context,
          // ).showSnackBar(SnackBar(content: Text(state.errMessage)));
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
                //suffixIcon: Icon(Icons.person),
                onChanged: (fristName) {
                  authCubit.fristName = fristName;
                },
              ),
              CustomTextFormField(
                //suffixIcon: Icon(Icons.person),
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                //suffixIcon: Icon(Icons.email),
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomTextFormField(
                suffixIcon: IconButton(
                  onPressed: () {
                    authCubit.obsecurePasswordText();
                  },
                  icon: Icon(
                    authCubit.obsecurePasswordTextValue == true
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                  ),
                ),
                labelText: AppStrings.password,
                onChanged: (password) {
                  authCubit.password = password;
                },
                obscureText: authCubit.obsecurePasswordTextValue,
              ),
              TermsAndConditions(),
              SizedBox(height: 88),
              state is SignUpLoading
                  ? CircularProgressIndicator(color: AppColor.primaryColor)
                  : CustomButton(
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
