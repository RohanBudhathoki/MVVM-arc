import 'package:flutter/material.dart';
import 'package:listapp/data/network/firebaseauth_servies.dart';
import 'package:listapp/res/color.dart';
import 'package:listapp/res/component/common_button.dart';
import 'package:listapp/res/space.dart';
import 'package:listapp/utils/config/utils.dart';
import 'package:listapp/utils/routes/route_name.dart';
import 'package:provider/provider.dart';
import '../../../res/app_string.dart';
import '../../../res/component/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController displayNameController = TextEditingController();
  final authService = Provider.of<AuthenticationService>;
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
              Text(
                AppString.loginAccount,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColor.whiteColor,
                ),
              ),
              const SpaceH16(),
              Text(
                AppString.loginContent,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                ),
              ),
              const SpaceH28(),
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
                onPressed: () async {
                  if (emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Email field is empty', context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'passowrd field is empty', context);
                  } else if (passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Password is less then 6 character', context);
                  } else {
                    context.read<AuthenticationService>().logInWithEmail(
                        emailController.text, passwordController.text, context);
                  }
                },
                text: 'Sign In',
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.signUp);
                },
                child: const Text(
                  'Sign Up here',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColor.whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
