import 'package:flutter/material.dart';

import '../widgets/order_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      centerTitle: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/icon_app.png',
            width: 20,
            height: 21,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text('Store Admin'),
        ],
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: (mediaQuery.size.height -
                    appBar.preferredSize.height -
                    kBottomNavigationBarHeight -
                    mediaQuery.padding.top -
                    mediaQuery.padding.bottom) *
                0.3,
            width: mediaQuery.size.width,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/images/home_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: (mediaQuery.size.height -
                    appBar.preferredSize.height -
                    kBottomNavigationBarHeight -
                    mediaQuery.padding.top -
                    mediaQuery.padding.bottom) *
                0.7,
            child: const OrderList(),
          )
        ],
      ),
    );
  }
}
