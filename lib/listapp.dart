import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:listapp/data/network/firebaseauth_servies.dart';
import 'package:listapp/utils/routes/route_name.dart';
import 'package:listapp/view/authenticaiton/login/login_screen.dart';
import 'package:listapp/wrapper.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
            create: (_) => context.read<AuthenticationService>().authState,
            initialData: null)
      ],
      child: const MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        home: AuthWrapper(),
      ),
    );
  }
}
