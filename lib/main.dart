import 'package:flutter/material.dart';
import 'package:mild_dairy_web/model/admin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';
import 'screens/admin_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milk Dairy Management',
      theme: ThemeData(primarySwatch: Colors.green),
     home:  LoginScreen(),//add islogged in parameter

      debugShowCheckedModeBanner: false,
    );
  }
}
