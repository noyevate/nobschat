import 'package:nobschat/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.username, required token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["_id"],
        email: json["email"],
        username: json["username"],
        token: json['token']);
  }
}
