import 'package:flutter_node_store/screens/welcome/welcome_screen.dart';

class AppRouter{
  // Router mapp key
  static const String welcome = 'welcome';

  // Router Map
  static get routes => {
    welcome: (context) => WelcomeScreen(),
  };

}