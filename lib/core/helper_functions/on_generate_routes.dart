
import 'package:flutter/material.dart';
import 'package:marketi_app/features/splash/presentation/views/splash_view.dart';

import '../../features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
     case OnBoardingView.routeName:
       return MaterialPageRoute(builder: (context) => const OnBoardingView());
    // case SignInView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SignInView());
    // case SignUpView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SignUpView());
    //   case HomeView.routeName:
    //   return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
