import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/constants/strings.dart';
import 'package:new_project/widgets/my_app.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.darkThemeBacgroundColor,
    statusBarColor: AppColors.darkThemeBacgroundColor,
  ));

  await Hive.initFlutter();
  await Hive.openBox(Str.BOX_OF_PRODUCTS_ID);
  runApp(const MyApp());
}
