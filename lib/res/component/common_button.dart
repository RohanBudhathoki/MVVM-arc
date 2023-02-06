import 'package:flutter/material.dart';
import 'package:listapp/res/color.dart';

class CommonAuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CommonAuthButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.whiteColor.withOpacity(0.5),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18,
              height: 1.3,
              color: AppColor.blackColor,
              fontWeight: FontWeight.w700,
              fontFamily: 'Mulish'),
        ),
      ),
    );
  }
}
