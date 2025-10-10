import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/routes/routes.dart';
import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/forget_password_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSucess) {
          // showToast("Welcome Back!");
          FirebaseAuth.instance.currentUser!.emailVerified == true
              ? customReplacementNavigate(context, AppRouter.khome)
              : showToast("Please Verify Your Account");
        } else if (state is SignInFailure) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signInFormKey,
          autovalidateMode: authCubit.signUpAutovalidateMode,
          child: Column(
            children: [
              //SizedBox(height: 16),
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
              SizedBox(height: 7),
              ForgetPasswordTextWidget(),
              SizedBox(height: 102),
              state is SignInLoading
                  ? CircularProgressIndicator(color: AppColor.primaryColor)
                  : CustomButton(
                    // color:
                    //     authCubit.termsAndConditionCheckBoxValue == false
                    //         ? AppColor.grey
                    //         : null,
                    onPressed: () {
                      if (authCubit.signInFormKey.currentState!.validate()) {
                        authCubit.signInWithEmailAndPassword();
                      }
                    },
                    textButton: AppStrings.signIn,
                  ),
            ],
          ),
        );
      },
    );
  }
}
