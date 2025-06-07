import 'package:nobschat/features/auth/domain/entities/login_user_entity.dart';
import 'package:nobschat/features/auth/domain/entities/user_entity.dart';

class LoginUserModel extends LoginUserEntity {
  LoginUserModel({required super.id, required super.email, required super.username, required super.token});

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
        id: json["_id"],
        email: json["email"],
        username: json["username"],
        token: json['token']);
  }
}
