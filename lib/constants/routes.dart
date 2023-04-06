import 'package:new_project/constants/strings.dart';
import 'package:new_project/screens/bottom_bar_screen_widgets/botton_bar_screen.dart';
import 'package:new_project/screens/firs_screen.dart/first_screen.dart';

class Routes {
  static final routes = {
    Str.HOME_SCREEN: (context) => const BottomBarScreen(),
    Str.FIRST_SCREEN: (context) => const FirstScreen()
  };
}
