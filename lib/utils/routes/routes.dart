import 'package:flutter/material.dart';
import 'package:listapp/utils/routes/route_name.dart';
import 'package:listapp/view/authenticaiton/signup/signup_screen.dart';
import '../../view/authenticaiton/login/login_screen.dart';
import '../../view/home/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}
