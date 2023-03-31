import 'package:flutter/material.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ListTile(
          leading: Icon(Icons.person),
          title: Text("Account"),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        ),
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        ),
        SwitchListTile(
          title: provider.getDarkTheme
              ? const Text("Dark theme")
              : const Text("Light theme"),
          secondary: provider.getDarkTheme
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
          onChanged: (bool value) {
            setState(() {
              provider.setDarkTheme = value;
            });
          },
          value: provider.getDarkTheme,
        ),
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        ),
      ],
    );
  }
}
