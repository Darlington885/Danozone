
import 'package:flutter/material.dart';

import '../auth/login_screen.dart';
import '../home/home_screen.dart';
import '../splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());
      // case DashBoardScreen.routeName:
      //   return MaterialPageRoute(builder: (_) => const DashBoardScreen());

      default:
      // If there is no such named route in the switch statement, e.g. /third
      // return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
