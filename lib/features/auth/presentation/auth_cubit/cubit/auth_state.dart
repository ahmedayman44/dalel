part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSucess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class UpdateTermsAndConditionCheckBoxValue extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSucess extends AuthState {}

final class SignInFailure extends AuthState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}
