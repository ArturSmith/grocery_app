import 'package:flutter/material.dart';
import 'package:new_project/constants/my_text_decoration.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: ThemeStyles.setColor(context, true),
        title: Text(
          "Sign in anon",
          style: MyTextDecoration.titleTextStyle(context),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: (() async {
                final result = await _auth.signInAnnon();
              }),
              child: Text(
                "Sign in anon",
                style: TextStyle(color: ThemeStyles.setColor(context, true)),
              ))),
    );
  }
}
