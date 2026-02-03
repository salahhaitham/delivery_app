

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/userEntity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.Uid,
    required super.UserName,
    super.profileImg,
    required super.phoneNumber
  });

  factory UserModel.fromfirebaseAuth(User user) {
    return UserModel(
      email: user.email ?? "",
      Uid: user.uid ?? "",
      UserName: user.displayName ?? "",
      phoneNumber: user.phoneNumber??""

    );
  }
  factory UserModel.fromjson(Map<String,dynamic>json) {
    return UserModel(
        email:json['email']??"",
        Uid:json['Uid']??"",
        UserName:json['name']??"",
        profileImg: json["profileImage"],
        phoneNumber: json["phoneNumber"]??""

    );
  }
  factory UserModel.fromuserentity(UserEntity userEntity) {
    return UserModel(
        email:userEntity.email,
        Uid:userEntity.Uid,
        UserName:userEntity.UserName,
        profileImg: userEntity.profileImg,
        phoneNumber: userEntity.phoneNumber
    );
  }
  ToMab(){
    return
      {
        'name':UserName,
        'email':email,
        'Uid':Uid,
        "profileImage": profileImg,
        "phoneNumber":phoneNumber
      };
  }

}
