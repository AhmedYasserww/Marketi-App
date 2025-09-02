import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi_app/core/helper_functions/on_generate_routes.dart';
import 'package:marketi_app/features/auth/presentation/views/sign_in_view.dart';

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
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),

        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoutes,
        initialRoute: SignInView.routeName,


    );
  }
}

