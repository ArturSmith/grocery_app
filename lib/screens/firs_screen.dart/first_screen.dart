// Flutter imports:
import 'package:flutter/material.dart';
import 'package:new_project/screens/bottom_bar_screen_widgets/botton_bar_screen.dart';
import 'package:new_project/screens/firs_screen.dart/warapper.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/constants/consts.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/models/favorites_screen_model.dart';
import 'package:new_project/widgets/sun_button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationControllerRotation =
      AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late final AnimationController _animationControllerScale =
      AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationControllerRotation,
    curve: Curves.linear,
  );

  @override
  void initState() {
    super.initState();
    context.read<FavoritesScreenModel>().loadProductsFromHive();
    goAhead();
    _animationControllerScale.forward();
    _animationControllerRotation
      ..forward()
      ..addListener(() {
        if (_animationControllerRotation.isCompleted) {
          _animationControllerRotation.repeat();
        }
      });
  }

  goAhead() async {
    await Future.delayed(const Duration(seconds: 5));
    await _animationControllerScale.reverse();
    navigate();
  }

  navigate() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: ((_, __, ___) => const Wrapper()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _animationControllerRotation.dispose();
    _animationControllerScale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(gradient: ThemeStyles.gradient),
          )),
          _AnimationOnFirstScreen(
            animationRotation: _animationControllerRotation,
            animationScale: _animationControllerScale,
          ),
        ],
      ),
    );
  }
}

class _AnimationOnFirstScreen extends StatelessWidget {
  const _AnimationOnFirstScreen(
      {super.key, this.animationRotation, this.animationScale});
  final animationRotation;
  final animationScale;
  @override
  Widget build(BuildContext context) {
    final screenSize = Consts.screenSize(context);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(flex: 10),
        Text(
          "BERKAT",
          style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.15,
              fontWeight: FontWeight.w900),
        ),
        const Spacer(flex: 3),
        ScaleTransition(
            scale: animationScale,
            child: SunButton(
              animation: animationRotation,
              size: screenSize.width * 0.2,
              color: Colors.amber,
            )),
        const Spacer(flex: 10),
      ]),
    );
  }
}
