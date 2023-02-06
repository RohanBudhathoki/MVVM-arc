import 'package:flutter/material.dart';
import 'package:listapp/data/network/firebaseauth_servies.dart';
import 'package:provider/provider.dart';

import '../../../res/app_string.dart';
import '../../../res/color.dart';
import '../../../res/component/common_button.dart';
import '../../../res/component/common_textfield.dart';
import '../../../res/space.dart';
import '../../../utils/config/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/image/login_background.png',
              ))),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: AppColor.whiteColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25)),
          child: ListView(
            children: [
              const Text(
                'Sign Up to LogIn',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColor.whiteColor,
                ),
              ),
              const SpaceH16(),
              Text(
                AppString.loginContent,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                ),
              ),
              const SpaceH20(),
              RegisterTextfield(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                hintText: 'Email',
              ),
              const SpaceH20(),
              RegisterTextfield(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  hintText: 'Password'),
              const SpaceH28(),
              CommonAuthButton(
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Email field is empty', context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'passowrd field is empty', context);
                  } else if (passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Password is less then 6 character', context);
                  } else {
                    context.read<AuthenticationService>().signUpWithEmail(
                        emailController.text, passwordController.text, context);

                    Utils.flushBarErrorMessage('Api hit', context);
                  }
                },
                text: 'SIGN UP',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
