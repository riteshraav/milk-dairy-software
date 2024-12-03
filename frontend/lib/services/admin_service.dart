import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/admin.dart';

Future<void> signupUser(String username, String password, String confirmPassword) async {
  final url = Uri.parse('http://localhost:8080/admin/signup');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'name': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print('User registered: ${response.body}');

  } else {
    print('Error: ${response.statusCode}');

  }
}
Future<Admin> loginuser(String username) async {
  final url = Uri.parse('http://localhost:8080/admin/login/$username');

  final response = await http.get(url);
  final data = json.decode(response.body);
  return Admin.fromJson(data);

}

