import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi_app/core/helper_functions/on_generate_routes.dart';
import 'package:marketi_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:marketi_app/features/home/data/repos/get_all_brands_repo/get_all_brands_repo_imp.dart';
import 'package:marketi_app/features/home/data/repos/get_all_categories_repo/get_all_category_repo_imp.dart';
import 'package:marketi_app/features/home/data/repos/get_all_products_repo/get_all_product_repo_imp.dart';
import 'package:marketi_app/features/home/presentation/views/home_view.dart';
import 'package:marketi_app/features/navigation_bar/presentation/views/button_nav_bar_view.dart';

import 'core/service_locator/service_locator.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // ✅ استدعاء الـ Service Locator
//   setupServiceLocator();
//
//   // ✅ نجيب الريبو من GetIt
//   final getAllCategoriesRepo = getIt<GetAllBrandsRepoImp>();
//
//   // ✅ نعمل تست على الـ API قبل ما التطبيق يشتغل
//   final result = await getAllCategoriesRepo.fetchAllBrands();
//
//   result.fold(
//         (failure) {
//       log('❌ API Test Failed: ${failure.errorMessage}');
//     },
//         (categories) {
//       log('✅ API Test Success: ${categories.length} CATEGORIES fetched');
//       log("===================================================");
//
//       for (var category in categories) {
//         log("🆔 ID       : ${category.id}");
//         log("📌 Name     : ${category.name}");
//         log("🖼️ Image    : ${category.imagePath}");
//         log("🔄 Version  : ${category.v}");
//         log("===================================================");
//       }
//     },
//   );
//
//   runApp(const MyApp());
// }
void main() {
  setupServiceLocator();
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

