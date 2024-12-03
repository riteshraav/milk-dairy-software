import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_screen.dart';

void logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('isLoggedIn');
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
}