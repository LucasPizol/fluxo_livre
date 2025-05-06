import 'package:app_fluxo_livre/src/models/user.dart';
import 'package:app_fluxo_livre/src/services/user_api_service.dart';
import 'package:flutter/material.dart';

class UserRegisterProvider with ChangeNotifier {
  Future<void> resterUser(User user) async {
    try {
      final response = await UserApiService.registerUser(user);
      if (response.statusCode != 201) {
        throw 'Erro ao Cadastrar usuário';
      }
    } catch (error) {
      throw error.toString();
    }
  }
}
