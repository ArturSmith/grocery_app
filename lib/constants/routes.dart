// Project imports:
import 'package:new_project/constants/strings.dart';
import 'package:new_project/screens/authenticate_screen.dart/logIn_screen.dart';
import 'package:new_project/screens/authenticate_screen.dart/signup_screen.dart';
import 'package:new_project/screens/bottom_bar_screen_widgets/botton_bar_screen.dart';
import 'package:new_project/screens/favorites_screen_widgets/favorites_screen.dart';
import 'package:new_project/screens/firs_screen.dart/first_screen.dart';

class Routes {
  static final routes = {
    Str.HOME_SCREEN: (context) => const BottomBarScreen(),
    Str.FIRST_SCREEN: (context) => const FirstScreen(),
    Str.FAVORITES_SCREEN: (context) => const FavoritesScreen(),
    Str.SIGN_UP_SCREEN: (context) => const SignUpScreen(),
    Str.LOG_IN_SCREEN: (context) => const LoginScreen()
  };
}
