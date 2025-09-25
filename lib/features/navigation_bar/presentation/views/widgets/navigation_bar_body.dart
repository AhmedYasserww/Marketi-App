import 'package:flutter/material.dart';
import 'package:marketi_app/features/favorite/presentation/views/favorite_view.dart';
import 'package:marketi_app/features/home/presentation/views/home_view.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/open_profile_drawer.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../cart/presentation/views/cart_view.dart';

class NavigationBarBody extends StatefulWidget {
  const NavigationBarBody({super.key});

  @override
  NavigationBarBodyState createState() => NavigationBarBodyState();
}

class NavigationBarBodyState extends State<NavigationBarBody> {
  int selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> views = const [
    HomeView(),
    CartView(),
    FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 3) {
            openProfileDrawer(context);
          } else {
            setState(() {
              selectedIndex = index;
            });
          }
        },
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.lightPrimaryColor,
        unselectedItemColor: const Color(0xff67687E),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: "cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "profile"),
        ],
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: selectedIndex,
        children: views,
      ),
    );
  }
}

