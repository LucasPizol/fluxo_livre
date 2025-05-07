import 'dart:convert';

import 'package:app_fluxo_livre/src/models/user.dart';
import 'package:app_fluxo_livre/src/services/user_api_service.dart';
import 'package:flutter/material.dart';

List<User> users = [
  User(
    id: 1,
    name: 'João da Silva',
    email: 'joao.silva@example.com',
    password: '123456',
  ),
  User(
    id: 2,
    name: 'Maria Oliveira',
    email: 'maria.oliveira@example.com',
    password: '123456',
  ),
  User(
    id: 3,
    name: 'Pedro Santos',
    email: 'pedro.santos@example.com',
    password: '123456',
  )
];

bool isMock = true;

class UserProvider with ChangeNotifier {
  Future<List<User>> getUsers() async {
    try {
      if (isMock) {
        await Future.delayed(const Duration(milliseconds: 500));

        return users;
      }

      final response = await UserApiService.getUsers();

      if (response.statusCode != 200) {
        throw 'Erro ao Buscar usuários';
      }

      return jsonDecode(response.body)
          .map<User>((user) => User.fromJson(user))
          .toList();
    } catch (error) {
      throw error.toString();
    }
  }

  Future<void> updateUser(User user, User newUser) async {
    try {
      users[users.indexOf(user)] = newUser;
      notifyListeners();
    } catch (error) {
      throw error.toString();
    }
  }
}
