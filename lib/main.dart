import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'listapp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}
