import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nobschat/common/api_exceptions.dart';
import 'package:nobschat/common/size.dart';
import 'package:nobschat/features/conversation/data/model/conversation_model.dart';
import 'package:http/http.dart' as http;

class ConversationRemoteDataSource {
  final String baseUrl = appBaseUrl;
  final _storage = FlutterSecureStorage();


  Future<List<ConversationModel>> fetchConversation() async {
    String token = await _storage.read(key: 'token') ?? '';
    try {
      final response = await http.get(
      Uri.parse("$baseUrl/conversations"),
      headers: {
        'Authorization': 'Bearer $token',
      }
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => ConversationModel.fromJson(json)).toList();

    } else {
      final body = jsonDecode(response.body);
      throw ApiException(body['message'] ?? 'something went wrong',
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

}