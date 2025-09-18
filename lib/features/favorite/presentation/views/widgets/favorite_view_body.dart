import 'package:flutter/material.dart';
import 'package:marketi_app/core/widgets/custom_app_bar.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_item_list_view.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_summary.dart';
import 'package:marketi_app/features/favorite/presentation/views/widgets/favorite_item_grid_view.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/search_bar_widget.dart';

import '../../../../../core/utils/app_color.dart';


class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           SizedBox(height: 16),
           CustomAppBar(title: "Favorites"),
           SizedBox(height: 12),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 14),
            child:  SearchBarWidget(),
          ),
           SizedBox(height: 14),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 14),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Your Favorites",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.primaryColor),)),
          ),
           SizedBox(height: 14,),
          Expanded(
            child: FavoriteItemGridView(),
          ),
        ],
      ),
    );
  }
}


