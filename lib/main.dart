import 'package:flutter/material.dart';
import 'package:marketi_app/core/helper_functions/on_generate_routes.dart';
import 'package:marketi_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme:  ThemeData(
            scaffoldBackgroundColor: Colors.white,

            fontFamily: 'Cairo',
            // colorScheme: ColorScheme.fromSeed(
            //     seedColor:AppColors.primaryColor
            // )
        ),

        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoutes,
        initialRoute: SplashView.routeName,


    );
  }
}

