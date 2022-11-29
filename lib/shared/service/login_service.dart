import 'dart:async';
import 'dart:convert';

import 'package:fast_park/shared/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../constants/routes.dart';

var url = Uri.parse(Routes().signIn());

class AuthClient {
  Future<User> login(
    String email,
    String password,
  ) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signIn()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse =
          jsonDecode((const Utf8Codec().decode(response.bodyBytes)));
      Map<String, dynamic>? json = mapResponse;
      return User.fromJson(json);
    } else {
      Map<String, dynamic> mapResponse =
          jsonDecode((const Utf8Codec().decode(response.bodyBytes)));
      Map<String, dynamic>? json = mapResponse;
      return User.fromJson(json);
    }
  }
}
