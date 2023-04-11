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
import 'package:new_project/screens/authenticate_screen.dart/logIn_screen.dart';
import 'package:new_project/screens/bottom_bar_screen_widgets/botton_bar_screen.dart';
import 'package:new_project/services/auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  decoration:
                      const BoxDecoration(gradient: ThemeStyles.gradient),
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
        resizeToAvoidBottomInset: false,
        body: Forms());
  }
}

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String confirmedPassword = '';
  String userName = '';
  bool errorVisible = false;
  AuthService _auth = AuthService();

  navigatePop() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Consts.screenSize(context).width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Spacer(flex: 10),
            Visibility(
              visible: errorVisible,
              child: const FittedBox(
                  child: Text(
                "Invalid email or password",
                style: TextStyle(color: Colors.red),
              )),
            ),
            const Spacer(flex: 1),
            TextFormField(
              onChanged: ((value) => setState(() => userName = value)),
              validator: (value) => value!.isEmpty ? "Enter a user name" : null,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              toolbarOptions: const ToolbarOptions(
                  copy: true, paste: true, selectAll: true),
              cursorColor: Colors.black,
              decoration:
                  TextFieldDecoration.decoration(context, "User name", null),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TextFormField(
                onChanged: ((value) => setState(() => email = value)),
                validator: (value) => value!.isEmpty ? "Enter an email" : null,
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
            TextFormField(
              onChanged: ((value) => setState(() => password = value)),
              validator: (value) =>
                  value!.length < 9 ? "Enter a password 9+ chars long" : null,
              obscureText: true,
              maxLength: 9,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              decoration:
                  TextFieldDecoration.decoration(context, "Password", null),
            ),
            const Spacer(flex: 1),
            TextFormField(
              onChanged: ((value) => setState(() => confirmedPassword = value)),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Confirm password";
                } else if (value != password) {
                  return "Wrong password";
                } else {
                  return null;
                }
              },
              obscureText: true,
              maxLength: 9,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              decoration: TextFieldDecoration.decoration(
                  context, "Confirm password", null),
            ),
            const Spacer(flex: 1),
            ElevatedButton(
              onPressed: (() async {
                if (_formKey.currentState!.validate()) {
                  dynamic result = _auth.signUpWithEmailAndPassword(
                      email.trim(), password.trim(), userName);
                  if (result == null) {
                    errorVisible = true;
                  } else {
                    errorVisible = false;
                    navigatePop();
                  }
                }
                setState(() {});
              }),
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
