import 'package:flutter/material.dart';
import 'package:marketi_app/features/favorite/presentation/views/widgets/favorite_view_body.dart';
class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
static const String routeName='favorite';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoriteViewBody(),
    );
  }
}
