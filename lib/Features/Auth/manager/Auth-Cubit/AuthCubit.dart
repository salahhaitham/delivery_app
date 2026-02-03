
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/userEntity.dart';
import '../../domain/repos/authRepo/AuthRepo.dart';

part 'Auth_state.dart';

class Authcubit extends Cubit<AuthState> {
  Authcubit(this.authRepo) : super(SignInInitial());
  AuthRepo authRepo;
  Future<void> SigninUserWithEmailandPassword(
    String email,
    String password,
    String username,
  ) async {
    if (state is SignInLoading) return;

    emit(SignInLoading());

    var result = await authRepo.SignInUserWithEmailAndPassword(
      email,
      password,
      username,
    );
    result.fold(
      (failure) => emit(SignInFailure(failure.errMessage)),
      (userentity) => emit(SignInSuccess(userentity)),
    );
  }
  Future<void>CreateUserWithEmailandPassword(String email,String password,String username,String phoneNumber)async{
    if (state is SignUpLoading) return;

    emit(SignUpLoading());

    var result=await authRepo.CreateUserWithEmailAndPassword(email, password,username,phoneNumber);
    result.fold(
            (failure)=>emit(SignUpFailure(failure.errMessage)),
            (userentity)=>emit(SignUpSuccess(userentity))
    );



  }
  // Future<void> SigninUserWithGoogleAccount() async {
  //   if (state is SignInLoading) return;
  //
  //   emit(SignInLoading());
  //
  //   var result = await authRepo.SignInWithGoogle();
  //   result.fold(
  //     (failure) => emit(SignInFailure(failure.errormessage)),
  //     (userentity) => emit(SignInSuccess(userentity)),
  //   );
  // }
  // Future<void> SigninUserWithFacebook() async {
  //   if (state is SignInLoading) return;
  //
  //   emit(SignInLoading());
  //
  //   var result = await authRepo.SignInWithFacebook();
  //   result.fold(
  //         (failure) => emit(SignInFailure(failure.errormessage)),
  //         (userentity) => emit(SignInSuccess(userentity)),
  //   );
  // }
}
