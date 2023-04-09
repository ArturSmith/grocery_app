// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/constants/consts.dart';
import 'package:new_project/constants/strings.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/entitis/my_user.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/authenticate_screen.dart/logIn_screen.dart';
import 'package:new_project/services/auth.dart';
import 'my_list_tile.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  void Login(BuildContext context) {
    Consts.navigate(const LoginScreen(), context, 300, false);
  }

  Future<void> _showLogOutDialog() async {
    final auth = AuthService();

    await showDialog(
        barrierDismissible: true,
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Flexible(
                child: Text(
              "Do you want to logOut?",
              style: TextStyle(fontSize: 20),
            )),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: (() {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    }),
                    child: const Text("Cancel")),
                const SizedBox(width: 10),
                TextButton(
                    onPressed: (() async {
                      await auth.signOut();
                    }),
                    child: const Text("Yes")),
              ],
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final user = Provider.of<MyUser?>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text("UserName"),
          const SizedBox(height: 10),
          Divider(
            color: ThemeStyles.setThemeColor(context, true),
            thickness: 3,
            indent: 15,
            endIndent: 15,
          ),
          MyListTile(
            onTap: () {},
            leading: Icons.person,
            title: "Account",
            trailing: Icons.keyboard_arrow_right_outlined,
          ),
          MyListTile(
            onTap: () {},
            leading: Icons.settings,
            title: "Settings",
            trailing: Icons.keyboard_arrow_right_outlined,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
              title: Consts.isDark(context)
                  ? const Text("Light theme")
                  : const Text("Dark theme"),
              secondary: Consts.isDark(context)
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
              onChanged: (bool value) {
                setState(() {
                  provider.setDarkTheme = value;
                });
              },
              value: provider.getDarkTheme,
            ),
          ),
          MyListTile(
            onTap: () {
              user == null ? Login(context) : _showLogOutDialog();
            },
            leading: Icons.logout,
            title: user == null ? "LogIn" : "Logout",
            trailing: Icons.keyboard_arrow_right_outlined,
          ),
        ],
      ),
    );
  }
}
