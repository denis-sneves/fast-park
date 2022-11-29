import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants/routes.dart';

class CadastroService {
  signUp(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signUp()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    if (response.statusCode == 200) {
      return debugPrint("Usuario cadastrado com sucesso!");
    } else {
      return debugPrint("Erro ao cadastrar novo usuário");
    }
  }
}
