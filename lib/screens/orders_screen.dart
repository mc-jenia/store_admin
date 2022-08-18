import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../widgets/order_item_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 1,
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) {
          return const Card(
            elevation: 0,
            color: CustomColor.cultured,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: OrderItemList(),
            ),
          );
        },
      ),
    );
  }
}
