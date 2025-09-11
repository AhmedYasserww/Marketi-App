import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/service_locator/service_locator.dart';
import 'package:marketi_app/features/search/presentations/manager/search_for_product_cubit/search_for_product_cubit.dart';
import 'package:marketi_app/features/search/presentations/views/widgets/sarch_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
static const String routeName = 'search-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<SearchForProductCubit>(
          create: (context) =>getIt<SearchForProductCubit>(),
          child: const SafeArea(child:  SearchViewBody())) ,
    );

  }
}
