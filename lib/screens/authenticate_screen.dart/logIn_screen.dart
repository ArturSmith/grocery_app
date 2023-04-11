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
import 'package:new_project/screens/authenticate_screen.dart/signup_screen.dart';
import 'package:new_project/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
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
        body: const Forms());
  }
}

class Forms extends StatefulWidget {
  const Forms({super.key});
  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  String email = '';
  String password = '';
  bool errorVisible = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  navigatePop() {
    Navigator.pop(context);
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final screenWidth = Consts.screenSize(context).width;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Spacer(flex: 10),
            Visibility(
              visible: errorVisible,
              child: const Text(
                "Invalid email or password",
                style: TextStyle(color: Colors.red),
              ),
            ),
            const Spacer(flex: 1),
            TextFormField(
              validator: (value) => value!.isEmpty ? "Enter an email" : null,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              toolbarOptions: const ToolbarOptions(
                  copy: true, paste: true, selectAll: true),
              cursorColor: Colors.black,
              decoration:
                  TextFieldDecoration.decoration(context, "Email", null),
            ),
            const Spacer(flex: 2),
            TextFormField(
              validator: (value) => value!.length < 9 || value.isEmpty
                  ? "Enter a password 9+ chars long"
                  : null,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              maxLength: 9,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              decoration:
                  TextFieldDecoration.decoration(context, "Password", null),
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              onPressed: (() async {
                if (_formKey.currentState!.validate()) {
                  dynamic result = await _auth.logInWithEmailAndPassword(
                      email.trim(), password.trim());
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
                "Login",
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
            ),
            const Spacer(flex: 1),
            TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(
                      Consts.isDark(context) ? Colors.white : Colors.amber),
                  foregroundColor: MaterialStatePropertyAll(
                      Consts.isDark(context)
                          ? Colors.white
                          : AppColors.darkThemeBacgroundColor)),
              onPressed: (() {
                Consts.navigate(const SignUpScreen(), context, 300, false);
              }),
              child: const Text("Signup"),
            ),
            const Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
