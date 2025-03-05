import 'package:flutter/material.dart';
import 'package:marketi_app/features/splash/presentation/views/widgets/splash_view_body.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});
static const String routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashViewBody()),
    );
  }
}
