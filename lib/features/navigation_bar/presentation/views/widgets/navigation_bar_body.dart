import 'package:flutter/material.dart';
import 'package:marketi_app/features/favorite/presentation/views/favorite_view.dart';
import 'package:marketi_app/features/home/presentation/views/home_view.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../cart/presentation/views/cart_view.dart';
class NavigationBarBody extends StatefulWidget {
  const NavigationBarBody({super.key});
  @override
  State<NavigationBarBody> createState() => _NavigationBarBodyState();
}
class _NavigationBarBodyState extends State<NavigationBarBody> {
  int selectedIndex = 0 ;

  List<Widget> views = const [
    HomeView(),
     CartView(),
     FavoriteView(),
    // ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.lightPrimaryColor,
          unselectedItemColor: const Color(0xff67687E),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.menu),label: "profile"),


          ],),
        backgroundColor: Colors.white,
        body: views.elementAt(selectedIndex)
    );
  }
}
