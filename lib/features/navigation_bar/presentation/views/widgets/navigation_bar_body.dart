import 'package:flutter/material.dart';
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
    ProfileView()
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
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: "favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),


          ],),
        backgroundColor: const Color(0xffD6DAD8),
        body: views.elementAt(selectedIndex)
    );
  }
}
