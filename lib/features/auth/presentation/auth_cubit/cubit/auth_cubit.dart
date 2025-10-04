import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  AutovalidateMode signUpAutovalidateMode = AutovalidateMode.disabled;

  String? fristName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool? termsAndConditionCheckBoxValue = false;
  bool? obsecurePasswordTextValue = true;

  //! used when cliked in button without checkBox or no
  updateTermsAndConditionCheckBoxValue({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(UpdateTermsAndConditionCheckBoxValue());
  }

  signUpCreateUserWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSucess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignUpFailure(
            errMessage: 'The account already exists for that email.',
          ),
        );
      }
    } catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
    }
  }

  obsecurePasswordText() {
    if (obsecurePasswordTextValue == true) {
      obsecurePasswordTextValue = false;
    } else {
      obsecurePasswordTextValue = true;
    }

    emit(obsecurePasswordText());
  }
}
