import 'package:flutter/material.dart';
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'my_list_tile.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Future<void> _showLogOutDialog() async {
    await showDialog(
        barrierDismissible: true,
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Flexible(
                child: Text(
              "Do you want to sigh out?",
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
                TextButton(onPressed: (() {}), child: const Text("Yes")),
              ],
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final isDark = provider.getDarkTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text("UserName"),
        const SizedBox(height: 10),
        Divider(
          color: isDark ? Colors.white : AppColors.darkThemeBacgroundColor,
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
        ),
        MyListTile(
          onTap: () {
            // _showLogOutDialog();
          },
          leading: Icons.logout,
          title: "Login",
          trailing: Icons.keyboard_arrow_right_outlined,
        ),
      ],
    );
  }
}
