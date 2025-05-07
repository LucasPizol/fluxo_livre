import 'dart:convert';
import 'package:app_fluxo_livre/src/models/user.dart';
import 'package:app_fluxo_livre/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  static const String baseUrl = Constants.baseUrl;

  static Future<http.Response> registerUser(User user) async{
    final url = Uri.parse('$baseUrl/user');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson())
    );
    return response;
  }

  static Future<http.Response> getUsers() async{
    final url = Uri.parse('$baseUrl/user');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}