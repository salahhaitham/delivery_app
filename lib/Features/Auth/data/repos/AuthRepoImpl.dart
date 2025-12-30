
import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:delivery_app/Features/Auth/domain/entities/userEntity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/Services/Backend_EndPoints.dart';
import '../../../../core/Services/DatabaseServices.dart';
import '../../../../core/Services/FirebaseAuthService.dart';
import '../../../../core/Services/ShearedPreferenceSinglton.dart';
import '../../../../core/errors/CustomException.dart';
import '../../../../core/errors/Failure.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/repos/authRepo/AuthRepo.dart';
import '../models/userModel.dart';

class AuthRepoImp extends AuthRepo {
  FirebaseAuthService firebaseAuthService;
  DatabaseServices databaseServices;

  AuthRepoImp(this.firebaseAuthService, this.databaseServices);

  @override
  Future<Either<Failure, UserEntity>> CreateUserWithEmailAndPassword(
      String email,
      String password,
      String username,
      ) async {
    User? user;
    try {
      user = await firebaseAuthService.CreateuserwithEmailandPassword(
        email: email,
        password: password,
        name: username,
      );
      var userentity = UserEntity(
        email: email,
        Uid: user.uid,
        UserName: username,
      );

      await AddUserData(user: userentity);
      return right(userentity);
    } on CustomException catch (e) {
      return left(Failure(e.message));
    } on Exception catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteuser();
      }
      return Left(Failure('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.'));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> SignInUserWithEmailAndPassword(
      String email,
      String password,
      String username,
      ) async {
    try {
      var user = await firebaseAuthService.SignInuserwithEmailandPassword(
        email: email,
        password: password,
        name: username,

      );
     var userdata = await getUserData(userid: user.uid);
     SaveUserData(user: userdata);
      return right(userdata);
    } on CustomException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<void> AddUserData({required UserEntity user}) async {

    await databaseServices.adddata(
      collection: Backend_EndPoints.Userscollection,
      data:UserModel.fromuserentity(user).ToMab(),
      documentid: user.Uid,
    );
  }

  @override
  Future<UserEntity> getUserData({required String userid}) async {
    var userdata = await databaseServices.getdata(
      path: Backend_EndPoints.getusersdata,
      documentid: userid,
    );
    return UserModel.fromjson(userdata);
  }

  @override
  Future<void> SaveUserData({required UserEntity user}) async{
    var userdata= jsonEncode(UserModel.fromuserentity(user).ToMab());
    await SharedPrefernceSinglton.setString(Kuserdata, userdata);
  }
}