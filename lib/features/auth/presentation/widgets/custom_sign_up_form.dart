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
      //AuthCubit authCubit = BlocProvider.of<AuthCubit>(context),
      builder: (context, state) {
        return Form(
          //key: ,
          child: Column(
            children: [
              SizedBox(height: 16),

              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (fristName) {
                  BlocProvider.of<AuthCubit>(context).fristName = fristName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  BlocProvider.of<AuthCubit>(context).lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  BlocProvider.of<AuthCubit>(context).emailAddress =
                      emailAddress;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                onChanged: (password) {
                  BlocProvider.of<AuthCubit>(context).password = password;
                },
              ),
              TermsAndConditions(),
              SizedBox(height: 88),
              CustomButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(
                    context,
                  ).signUpCreateUserWithEmailAndPassword();
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
