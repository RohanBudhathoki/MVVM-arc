import 'package:flutter/material.dart';
import 'package:listapp/data/network/firebaseauth_servies.dart';
import 'package:listapp/res/component/common_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CommonAuthButton(
              text: 'Sign Out',
              onPressed: () {
                context.read<AuthenticationService>().signOut(context);
              })),
    );
  }
}
