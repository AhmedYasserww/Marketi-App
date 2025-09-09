
import 'package:flutter/material.dart';
import 'package:marketi_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:marketi_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:marketi_app/features/cart/presentation/views/cart_view.dart';
import 'package:marketi_app/features/home/data/models/brands_model/BrandModel.dart';
import 'package:marketi_app/features/home/data/models/categories_model/CategoryModel.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/home_view.dart';
import 'package:marketi_app/features/home/presentation/views/view_all_brands_view.dart';
import 'package:marketi_app/features/home/presentation/views/view_all_categories_view.dart';
import 'package:marketi_app/features/home/presentation/views/view_all_products_view.dart';
import 'package:marketi_app/features/navigation_bar/presentation/views/button_nav_bar_view.dart';
import 'package:marketi_app/features/splash/presentation/views/splash_view.dart';

import '../../features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
     case OnBoardingView.routeName:
       return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
      case ButtonNavBarView.routeName:
        return MaterialPageRoute(builder: (context) => const ButtonNavBarView());
      case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
      case CartView.routeName:
      return MaterialPageRoute(builder: (context) => const CartView());
    case ViewAllProductsView.routeName:
        settings.arguments as List<ProductModel>;
      return MaterialPageRoute(
        builder: (context) => const ViewAllProductsView(),
        settings: settings,
      );
      case ViewAllCategoriesView.routeName:
        settings.arguments as List<CategoryModel>;
      return MaterialPageRoute(
        builder: (context) => const ViewAllCategoriesView(),
        settings: settings,
      );
      case ViewAllBrandsView.routeName:
        settings.arguments as List<BrandModel>;
        return MaterialPageRoute(builder: (context) => const ViewAllBrandsView(),
          settings: settings
        );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
