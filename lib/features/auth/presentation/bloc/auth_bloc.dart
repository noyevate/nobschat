import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobschat/features/auth/domain/usecases/login_usecase.dart';
import 'package:nobschat/features/auth/domain/usecases/register_uecase.dart';
import 'package:nobschat/features/auth/presentation/bloc/auth_event.dart';
import 'package:nobschat/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../common/api_exceptions.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;

  final _storage = FlutterSecureStorage();
  AuthBloc({required this.registerUsecase, required this.loginUsecase})
      : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await registerUsecase.call(
          event.email, event.username, event.password);
      emit(AuthSuccess(message: "Registration successful"));
    } on SocketException {
      emit(AuthFailure(error: "No internet connection"));
    } on FormatException {
      emit(AuthFailure(error: "Bad response format"));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
      try {
        final user = await loginUsecase.call(event.email, event.password);
        await _storage.write(key: "token", value:  user.token);
        await _storage.write(key: "username", value:  user.username);
        await _storage.write(key: "email", value:  user.email);
      emit(AuthSuccess(message: "login successful"));
      } on SocketException {
        emit(AuthFailure(error: "No internet connection"));
    } on FormatException {
      emit(AuthFailure(error: "Bad response format"));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
