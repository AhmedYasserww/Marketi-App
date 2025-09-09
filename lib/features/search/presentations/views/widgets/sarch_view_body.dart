import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi_app/features/search/presentations/manager/search_for_product_cubit/search_for_product_cubit.dart';
import 'package:marketi_app/features/search/presentations/views/widgets/search_item_list_view.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_text_form_field_widget.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 6.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomTextField(
              onChange: (value) {
                BlocProvider.of<SearchForProductCubit>(context)
                    .searchForProduct(value!);
              },
              controller: searchController,
              hintText: 'What are you looking for?',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(AppImages.searchIcon),
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
                onPressed: () {
                  searchController.clear();
                  BlocProvider.of<SearchForProductCubit>(context)
                      .searchForProduct('');
                },
              ),
            ),
          ),
          const Expanded(child: SearchItemListView()),
        ],
      ),
    );
  }
}
