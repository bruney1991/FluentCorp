import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  /// 🔹 Login
  static Future<User?> loginUser(String email, String senha) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'senha': senha}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return User.fromJson(data['user']);
      } else {
        return null; // email ou senha incorretos
      }
    } catch (e) {
      print('Erro ApiService.loginUser: $e');
      return null;
    }
  }

  /// 🔹 Cadastro
  static Future<User?> registerUser(String nome, String email, String senha) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/users/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'nome': nome, 'email': email, 'senha': senha}),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return User.fromJson(data['user']);
      } else {
        return null; // falha no cadastro (ex: email já cadastrado)
      }
    } catch (e) {
      print('Erro ApiService.registerUser: $e');
      return null;
    }
  }

  /// 🔹 Atualizar usuário
  static Future<User?> updateUser(User user) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/api/users/${user.idUsuario}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ApiService.updateUser: $e');
      return null;
    }
  }

  /// 🔹 Deletar usuário
  static Future<bool> deleteUser(int idUsuario) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/api/users/$idUsuario'),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Erro ApiService.deleteUser: $e');
      return false;
    }
  }
}
