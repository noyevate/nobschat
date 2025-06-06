import 'package:nobschat/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:nobschat/features/auth/domain/entities/user_entity.dart';
import 'package:nobschat/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl({required this.authRemoteDatasource});
  
  @override
  Future<UserEntity> login(String email, String password) async{
    return await authRemoteDatasource.login(email: email, password: password);
  }
  
  @override
  Future<UserEntity> register(String email, String username, String password) async{
    return await authRemoteDatasource.register(email: email, password: password, username: username);
  }

  
  
}