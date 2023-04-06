import 'package:flutter/material.dart';
import 'package:new_project/constants/my_text_decoration.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/entitis/category.dart';
import 'package:new_project/models/categories_screen_model.dart';
import 'package:new_project/screens/categories_screen_widgets/categories_screen_body.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  CategoriesScreenModel readModel(BuildContext context) {
    return context.read<CategoriesScreenModel>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readModel(context).getAllCategories(),
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        Widget body;
        if (snapshot.hasData) {
          body =
              CategoriesScreenBody(categories: snapshot.data as List<Category>);
        } else if (snapshot.hasError) {
          body = Center(
            child:
                Text("Error", style: MyTextDecoration.titleTextStyle(context)),
          );
        } else {
          body = Center(
              child: CircularProgressIndicator(
            color: ThemeStyles.setThemeColor(context, true),
          ));
        }
        return body;
      },
    );
  }
}
