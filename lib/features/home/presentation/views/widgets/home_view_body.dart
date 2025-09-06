import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/banner_widget.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/best_for_you_list_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/brands_list_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/buy_again_list_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/categories_grid_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_product_item.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_section_header.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/popular_product_list_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/search_bar_widget.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFB),
      body: SafeArea(
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

                },
              ),
              const SizedBox(height: 8),
              const PopularProductsListView(),
              const SizedBox(height: 14),
              SectionHeader(
                title: "Category",
                onViewAll: () {},
              ),
              const SizedBox(height: 8),
              const CategoriesGridView(),
              const SizedBox(height: 16),
              SectionHeader(
                title: "Best For You",
                onViewAll: () {},
              ),

              const SizedBox(height: 8),
              const BestForYouListView(),
              const SizedBox(height: 14),
              SectionHeader(
                title: "Brands",
                onViewAll: () {},
              ),
              const SizedBox(height: 8),
              const BrandsListView(),
              const SizedBox(height: 14),
              SectionHeader(
                title: "Buy Again",
                onViewAll: () {},
              ),
              const SizedBox(height: 8),
              const BuyAgainListView(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

