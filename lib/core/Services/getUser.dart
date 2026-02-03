import 'dart:convert';

import 'package:delivery_app/core/Services/Backend_EndPoints.dart';

import '../../Features/Auth/data/models/userModel.dart';
import '../../Features/Auth/domain/entities/userEntity.dart';
import 'ShearedPreferenceSinglton.dart';

UserEntity getUser(){

  var userdata = SharedPrefernceSinglton.getString(Backend_EndPoints.getusersdata);
  if( userdata ==null){return UserEntity(email: "", Uid: "", UserName: "", phoneNumber: '');}
  var userentity=UserModel.fromjson(jsonDecode(userdata));
  return userentity;
}

