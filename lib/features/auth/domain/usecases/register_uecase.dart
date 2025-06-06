import 'package:nobschat/features/auth/domain/entities/user_entity.dart';
import 'package:nobschat/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase({required this.repository});

  Future<UserEntity> call(String email, String username, String password) {
    return repository.register(email, username, password);
  }


}