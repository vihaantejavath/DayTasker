import 'package:flutter/material.dart';


class SignInUpbutton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const SignInUpbutton({
    super.key,
    required this.onTap,
    required this.text,
    });



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(22),
        margin: EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(19, 108, 133, 1),
          borderRadius: BorderRadius.circular(8)
          ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 16,
              ),
          ),
        )
      ),
    );
  }
}