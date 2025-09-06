import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/home/presentation/manager/all_brands_cubit/get_all_brands_cubit.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_brand_item.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> brandImages = [
      "assets/images/Town_Team_test.png",
      "assets/images/JBL_test.png",
      "assets/images/SONY_Brand_test.png",

    ];
    return BlocBuilder<GetAllBrandsCubit, GetAllBrandsState>(
      builder: (context, state) {
        if (state is GetAllBrandsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetAllBrandsFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state is GetAllBrandsSuccess) {
          final brands = state.brands;

          if (brands.isEmpty) {
            return const Center(child: Text("No brands available"));
          }

          return SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final brand = brands[index];
                return CustomBrandItem(
                  brandName: brand.name ?? "Unknown",
                  imageUrl: brandImages[index],
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
