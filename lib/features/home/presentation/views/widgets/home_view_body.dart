import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/home/presentation/manager/all_brands_cubit/get_all_brands_cubit.dart';
import 'package:marketi_app/features/home/presentation/manager/all_categories_cubit/get_all_categories_cubit.dart';
import 'package:marketi_app/features/home/presentation/manager/all_products_cubit/get_all_product_cubit.dart';
import 'package:marketi_app/features/home/presentation/views/view_all_brands_view.dart';
import 'package:marketi_app/features/home/presentation/views/view_all_categories_view.dart';
import 'package:marketi_app/features/home/presentation/views/view_all_products_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/banner_widget.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/brands_list_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/categories_grid_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_section_header.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/popular_product_list_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/search_bar_widget.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return

       SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              const CustomHomeAppBar(),
              const SizedBox(height: 16),
              const SearchBarWidget(),
              const SizedBox(height: 14),
              const BannerWidget(),
              const SizedBox(height: 14),
              SectionHeader(
                title: "Popular Product",
                onViewAll: () {
                  final state = context.read<GetAllProductCubit>().state;

                  if (state is GetAllProductSuccess) {
                    final productsList = state.products;

                    Navigator.pushNamed(
                      context,
                      ViewAllProductsView.routeName,
                      arguments: productsList,
                    );
                  }
                },
              ),

              const SizedBox(height: 8),
              const PopularProductsListView(),
              const SizedBox(height: 14),
              SectionHeader(
                title: "Category",
                onViewAll: () {
                  final state = context.read<GetAllCategoriesCubit>().state;

                  if (state is GetAllCategoriesSuccess) {
                    final categoriesList = state.categories;

                    Navigator.pushNamed(
                      context,
                      ViewAllCategoriesView.routeName,
                      arguments: categoriesList,
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
              const CategoriesGridView(),
            //  const SizedBox(height: 16),
            //   SectionHeader(
            //     title: "Best For You",
            //     onViewAll: () {},
            //   ),
            //
            //   const SizedBox(height: 8),
            // //  const BestForYouListView(),
              const SizedBox(height: 14),
              SectionHeader(
                title: "Brands",
                onViewAll: () {
                  final state = context.read<GetAllBrandsCubit>().state;

                  if (state is GetAllBrandsSuccess) {
                    final brandsList = state.brands;

                    Navigator.pushNamed(
                      context,
                      ViewAllBrandsView.routeName,
                      arguments: brandsList,
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
              const BrandsListView(),
              const SizedBox(height: 14),
              // SectionHeader(
              //   title: "Buy Again",
              //   onViewAll: () {},
              // ),
            //  const SizedBox(height: 8),
            //  const BuyAgainListView(),
              const SizedBox(height: 20),
            ],
          ),
        ),

    );
  }
}

