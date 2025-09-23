import 'package:flutter/material.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/menu_item.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/menu_item_data.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      MenuItemData(
        icon: Icons.person_outlined,
        title: ' Your Profile',
        onTap: (){

        }
      ),
      MenuItemData(
        icon: Icons.edit,
        title: 'Edit Profile',
        onTap: () {

        }
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: menuItems.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: 60,
        endIndent: 20,
        color: Color(0xFFE5E5E5),
      ),
      itemBuilder: (context, index) {
        return MenuItem(data: menuItems[index]);
      },
    );
  }

  void _handleMenuTap(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title tapped'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}