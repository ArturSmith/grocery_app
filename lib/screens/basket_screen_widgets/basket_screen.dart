// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/constants/buttons_decoration.dart';
import 'package:new_project/constants/consts.dart';
import 'package:new_project/entities/my_user.dart';
import 'package:new_project/screens/authenticate_screen.dart/logIn_screen.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  void lognin(BuildContext context) {
    Consts.navigate(const LoginScreen(), context, 300, false);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Consts.screenSize(context).width;
    final user = Provider.of<MyUser?>(context);
    String message = user == null
        ? "Please login to see your basket"
        : "Your basket is empty";

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: FittedBox(
                child: Text(message,
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(height: 50),
            Visibility(
              visible: user == null ? true : false,
              child: Flexible(
                child: ElevatedButton(
                  style: ButtonsDecoration.buttonDecor(screenWidth, context),
                  onPressed: (() {
                    lognin(context);
                  }),
                  child: const Text("Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
