import 'package:flutter/material.dart';
import 'package:taipme_mobile/src/theme/styles.dart';


class LoginStateInput extends StatelessWidget {

 final String title;

  const LoginStateInput({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: TaipmeStyle.largeTextSize,
        color: TaipmeStyle.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}