import 'package:flutter_node_store/screens/login/login-screen.dart';
import 'package:flutter_node_store/screens/welcome/welcome_screen.dart';
import 'package:flutter_node_store/screens/login/login-screen.dart';

class AppRouter{
  // Router mapp key
  static const String welcome = 'welcome';
  static const String login = 'login';

  // Router Map
  static get routes => {
    welcome: (context) => WelcomeScreen(),
    login: (context) => LoginScreen(),
  };

}