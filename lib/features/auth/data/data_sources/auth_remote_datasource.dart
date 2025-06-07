import 'dart:convert';
import 'dart:io';
import 'package:nobschat/common/api_exceptions.dart';
import 'package:nobschat/common/size.dart';
import 'package:nobschat/features/auth/data/models/login_user_model.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  final String baseUrl = appBaseUrl;

  Future<LoginUserModel> login(
      {required String email, required String password}) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/auth/login'),
          body: jsonEncode({'email': email, "password": password}),
          headers: {'Content-Type': "application/json"});
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return LoginUserModel.fromJson(data['user']);
      } else {
        final body = jsonDecode(response.body);
        throw ApiException(body['message'] ?? 'Login failed',
            statusCode: response.statusCode);
      }
    } on SocketException {
      throw ApiException('No internet connection');
    } on FormatException {
      throw ApiException('Bad response format');
    } catch (e) {
      throw ApiException(e.toString());
    }
  }

  Future<UserModel> register(
      {required String email,
      required String password,
      required username}) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/auth/register'),
          body: jsonEncode(
              {'email': email, "password": password, 'username': username}),
          headers: {'Content-Type': "application/json"});

      if (response.statusCode == 201) {
        print("register response: ${response.body}");
        // final data = jsonDecode(response.body);
        var data = UserModel.fromJson(jsonDecode(response.body)['user']);
        return data;
      } else {
        final body = jsonDecode(response.body);
        throw ApiException(body['message'] ?? 'Register failed',
            statusCode: response.statusCode);
      }
    } on SocketException {
      throw ApiException('No internet connection');
    } on FormatException {
      throw ApiException('Bad response format');
    } catch (e) {
      print("e.toString(): ${e.toString()}");
      throw ApiException(e.toString());
    }
  }
}
