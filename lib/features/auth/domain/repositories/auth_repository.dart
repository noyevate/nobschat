import 'package:nobschat/features/auth/domain/entities/login_user_entity.dart';
import 'package:nobschat/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  // Future<UserEntity>login(String email, String password);

  Future<LoginUserEntity>login(String email, String password);

  Future<UserEntity>register(String email, String username, String password);
  
}