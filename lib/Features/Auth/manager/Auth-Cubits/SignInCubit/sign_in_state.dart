part of 'AuthCubit.dart';

@immutable
sealed class AuthState {}

final class SignInInitial extends AuthState {}
final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {
  final UserEntity userEntity;

  SignInSuccess(this.userEntity);

}

final class SignInFailure extends AuthState {
  final String message;

  SignInFailure(this.message);


}
final class SignUpLoading extends AuthState {}
final class SignUpFailure extends AuthState {
final String message;

SignUpFailure(this.message);


}
final class SignUpSuccess extends AuthState {
final UserEntity userEntity;

SignUpSuccess(this.userEntity);

}