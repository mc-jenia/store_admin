import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_admin/screens/more_screen.dart';
import 'package:store_admin/screens/orders_screen.dart';

import '../screens/categories_screen.dart';
import '../styles/colors.dart';
import '../screens/home_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const OrdersScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).removePadding();
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: CustomColor.black,
        unselectedItemColor: CustomColor.gray,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list_fill),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_rounded),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
