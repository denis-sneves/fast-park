// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants/routes.dart';
import '../../pages/login/login_page.dart';

class CadastroService {
  signUp(
      String email, String password, String name, BuildContext context) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signUp()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
          "displayName": name
        },
      ),
    );
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
      // ignore: use_build_context_synchronously
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Usuário cadastrado com sucesso!",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      ));
    } else {
      // ignore: use_build_context_synchronously
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Erro ao cadastrar novo usuário!",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      ));
    }
  }
}
