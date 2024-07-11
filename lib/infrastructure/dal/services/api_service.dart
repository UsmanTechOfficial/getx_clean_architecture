import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/core/exception/auth_exception.dart';
import '../model/user_model.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<UserModel?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw AuthException('Failed to login');
    }
  }

  Future<UserModel?> signup(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw AuthException('Failed to signup');
    }
  }
}
