import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_mobile/constant/api.dart';

class AuthService {
  static Future<http.Response> login({
    required String email,
    required String password,
  }) {
    return http.post(Uri.parse('$baseURL/api/auth/login'),
        headers: applicationJSON,
        body: jsonEncode({"email": email, "password": password}));
  }

  static Future<http.Response> register({
    required String email,
    required String password,
    required String confirmationPassword,
    required String shopname,
  }) {
    return http.post(Uri.parse('$baseURL/api/auth/register'),
        headers: applicationJSON,
        body: jsonEncode({
          "email": email,
          "password": password,
          "shopname": shopname,
          "confirmation_password": confirmationPassword
        }));
  }

  static Future<http.Response> checkToken({required String token}) {
    return http.post(Uri.parse('$baseURL/api/auth/check-token'),
        headers: applicationJSON, body: jsonEncode({"token": token}));
  }
}
