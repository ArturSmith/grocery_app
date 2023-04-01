import 'package:flutter/material.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import '../../constants/my_text_decoration.dart';

class CategoryDetailInfoWidget extends StatelessWidget {
  const CategoryDetailInfoWidget({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final isDark = provider.getDarkTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ThemeStyles.setColor(context)),
          onPressed: (() {
            Navigator.of(context).pop();
          }),
        ),
        backgroundColor: ThemeStyles.setColor(context),
        title: Text(category, style: MyTextDecoration.titleTextStyle(isDark)),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
