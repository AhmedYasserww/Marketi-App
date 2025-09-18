
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi_app/core/helper_functions/on_generate_routes.dart';
import 'package:marketi_app/features/cart/data/repo/cart_repo_imp.dart';
import 'package:marketi_app/features/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:marketi_app/features/favorite/data/repos/favorite_repo_imp.dart';
import 'package:marketi_app/features/favorite/presentation/manager/add_to_favorite_cubit/add_to_favorite_cubit.dart';
import 'package:marketi_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:marketi_app/features/home/data/repos/product_filter/product_filter_repo_imp.dart';
import 'package:marketi_app/features/navigation_bar/presentation/views/button_nav_bar_view.dart';
import 'core/service_locator/service_locator.dart';
import 'features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'features/home/presentation/manager/filter_product/get_filter_product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [


       // BlocProvider(
       //      create: (_) => GetAllProductBySingleCategoryCubit(getIt.get<GetAllProductBySingleProductRepoImp>()),
       //    ),
        BlocProvider(
          create: (_) => GetFilterProductCubit(getIt.get<GetFilteredProductsRepoImp>()),
        ),
        BlocProvider(
          create: (_) => AddToCartCubit(getIt.get<CartRepoImp>()),
        ),
        // BlocProvider(
        //   create: (_) => GetCartCubit(getIt.get<CartRepoImp>())..getCart(),
        //     ),
        // BlocProvider(
        //   create: (_) => DeleteFromCartCubit(getIt.get<CartRepoImp>()),
        // ),
        // BlocProvider(
        //   create: (_) => AddToFavoriteCubit(getIt.get<FavoriteRepoImp>()),
        // ),

        BlocProvider(
           create: (_) => CartCubit(getIt.get<CartRepoImp>())..getCart(),
        ),
        BlocProvider(
          create: (_) => FavoriteCubit(getIt.get<FavoriteRepoImp>())..getFavorite(),
        ),



      ],

        child: MaterialApp(
            theme:  ThemeData(
                scaffoldBackgroundColor: Colors.white,
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),

            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoutes,
            //initialRoute: SplashView.routeName,
            initialRoute: ButtonNavBarView.routeName


        ),
      );

  }
}

