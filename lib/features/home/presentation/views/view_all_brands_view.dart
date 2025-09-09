import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/brands_model/BrandModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/view_all_screen_widgets/view_all_brands_view_body.dart';
class ViewAllBrandsView extends StatelessWidget {
  const ViewAllBrandsView({super.key});
static const String routeName = 'view-all-brands';
  @override
  Widget build(BuildContext context) {
    final brandsList = ModalRoute.of(context)!.settings.arguments as List<BrandModel>;

    return Scaffold(
      body:ViewAllBrandsViewBody(
        brandsList: brandsList,
      ) ,
    );
  }
}
