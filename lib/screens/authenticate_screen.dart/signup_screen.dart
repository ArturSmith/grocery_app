// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/constants/buttons_decoration.dart';
import 'package:new_project/constants/consts.dart';
import 'package:new_project/constants/my_text_decoration.dart';
import 'package:new_project/constants/text_fiels_decoration.dart';
import 'package:new_project/constants/theme_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = Consts.screenSize(context);
    final screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: MyTextDecoration.titleTextStyle(context),
        ),
        centerTitle: true,
        flexibleSpace: Consts.isDark(context)
            ? null
            : Container(
                decoration: const BoxDecoration(gradient: ThemeStyles.gradient),
              ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Consts.isDark(context) ? Colors.black : Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Spacer(flex: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                toolbarOptions: const ToolbarOptions(
                    copy: true, paste: true, selectAll: true),
                cursorColor: Colors.black,
                decoration:
                    TextFieldDecoration.decoration(context, "Email", null),
              ),
            ),
            const Spacer(flex: 1),
            TextField(
              obscureText: true,
              maxLength: 8,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              decoration:
                  TextFieldDecoration.decoration(context, "Password", null),
            ),
            const Spacer(flex: 1),
            TextField(
              obscureText: true,
              maxLength: 8,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              decoration: TextFieldDecoration.decoration(
                  context, "Confirm password", null),
            ),
            const Spacer(flex: 1),
            ElevatedButton(
              onPressed: (() {}),
              style: ButtonsDecoration.buttonDecor(screenWidth, context),
              child: Text(
                "SignUp",
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
            ),
            const Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
