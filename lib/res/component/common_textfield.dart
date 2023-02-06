import 'package:flutter/material.dart';
import 'package:listapp/res/color.dart';

// ignore: must_be_immutable
class RegisterTextfield extends StatelessWidget {
  TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  final Image? imagesuffix;
  RegisterTextfield({
    Key? key,
    required this.controller,
    required this.hintText,
    this.imagesuffix,
    required this.keyboardType,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: obscureText,
        obscuringCharacter: '*',
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff666161)),
          suffixIcon: imagesuffix,
          fillColor: AppColor.whiteColor.withOpacity(0.2),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.borderTextfield, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: AppColor.borderTextfield, width: 1),
          ),
        ),
      ),
    );
  }
}
