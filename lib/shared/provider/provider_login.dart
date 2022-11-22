import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/routes.dart';

var url = Uri.parse(Routes().signIn());

class AuthApiClient {
  Future<Map<String, dynamic>?> login(
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
      final body = jsonDecode((const Utf8Codec().decode(response.bodyBytes)));
      Map<String, dynamic> mapResponse =
          jsonDecode((const Utf8Codec().decode(response.bodyBytes)));
      print(mapResponse);
      return mapResponse;
    }
  }
}
