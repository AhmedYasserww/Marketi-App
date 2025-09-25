import 'package:flutter/material.dart';
import 'package:marketi_app/features/navigation_bar/presentation/views/widgets/navigation_bar_body.dart';

import '../../../../core/utils/app_keys.dart';

class ButtonNavBarView extends StatelessWidget {
  const ButtonNavBarView({super.key});
  static const routeName = 'button-nav-bar-view';

  @override
  Widget build(BuildContext context) {
    return   NavigationBarBody(
      key: navBarKey,
    );
  }
}
