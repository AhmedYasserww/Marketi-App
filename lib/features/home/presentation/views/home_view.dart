import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/service_locator/service_locator.dart';
import 'package:marketi_app/features/home/data/repos/get_all_categories_repo/get_all_category_repo_imp.dart';
import 'package:marketi_app/features/home/data/repos/get_all_products_repo/get_all_product_repo_imp.dart';
import 'package:marketi_app/features/home/presentation/manager/all_categories_cubit/get_all_categories_cubit.dart';
import 'package:marketi_app/features/home/presentation/manager/all_products_cubit/get_all_product_cubit.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetAllProductCubit(getIt.get<GetAllProductRepoImp>())..fetchAllProducts(),
        ),
          BlocProvider(
          create: (_) => GetAllCategoriesCubit(getIt.get<GetAllCategoryRepoImp>())..fetchAllCategories(),
          ),
      ],
      child: const Scaffold(
        body:HomeViewBody() ,
      ),
    );
  }
}
