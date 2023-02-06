import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:listapp/view/authenticaiton/login/login_screen.dart';
import 'package:listapp/view/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'models/user_info.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final fireBaseUser = context.watch<User?>();

    if (fireBaseUser != null) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
