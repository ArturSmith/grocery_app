import 'package:flutter/material.dart';
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/screens/bottom_bar_screen_widgets/botton_bar_screen.dart';
import 'package:new_project/widgets/sun_button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
  );

  int count = 0;
  bool play = true;
  Color color = AppColors.darkThemeBacgroundColor;

  @override
  void initState() {
    super.initState();
    _animationController
      ..forward()
      ..addListener(() {
        if (_animationController.isCompleted) {
          _animationController.repeat();
        }
      });
    goAhead();
  }

  goAhead() async {
    await Future.delayed(const Duration(seconds: 3));
    _animationController.stop();
    navigate();
  }

  navigate() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: ((_, __, ___) => const BottomBarScreen()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(flex: 10),
          const Text(
            "WELCOME",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w900),
          ),
          const Spacer(flex: 3),
          SunButton(animation: _animation, size: 100),
          const Spacer(flex: 10),
        ]),
      ),
    );
  }
}
