
import 'package:flutter/material.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  initState() {
    super.initState();
    executeNavigation();
  }


  @override

  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.contain,
      ),
    );
  }
  void executeNavigation() {

    Future.delayed(const Duration(seconds:4), () {


       // Navigator.pushReplacementNamed(context, OnBoardingView.routeName);

    });
  }
}
