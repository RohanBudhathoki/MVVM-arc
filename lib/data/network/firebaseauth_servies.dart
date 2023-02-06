import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:listapp/utils/config/utils.dart';
import 'package:listapp/utils/routes/route_name.dart';

class AuthenticationService {
  final FirebaseAuth _auth;
  AuthenticationService(this._auth);

  //State Work
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  //Login
  Future<UserInfo?> logInWithEmail(
      String email, String password, BuildContext context) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      Navigator.pushNamed(context, RouteName.home);

      Utils.flushBarSucessMessage('Login is SuccesFull', context);
    } on FirebaseException catch (e) {
      Utils.flushBarErrorMessage(e.toString(), context);
    }
  }

  //Sign UP
  Future signUpWithEmail(
      String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await emailVerification(context);
      Utils.flushBarSucessMessage('Sign UP is SuccesFull', context);
    } on FirebaseException catch (e) {
      Utils.flushBarErrorMessage(e.toString(), context);
    }
  }

  //Email Verification
  Future<void> emailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      Utils.flushBarErrorMessage('Email Verification sent', context);
      Navigator.pushNamed(context, RouteName.login);
    } on FirebaseException catch (e) {
      Utils.flushBarErrorMessage(e.toString(), context);
    }
  }

  //Sign Out

  Future signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushNamed(context, RouteName.login);
    } on FirebaseAuthException catch (e) {
      Utils.flushBarErrorMessage(e.toString(), context);
    }
  }
}
