import 'package:flutter/material.dart';

import '../styles/colors.dart';
import 'order_item_list.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomCenter,
            child: Text(
              "Latest Orders",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: GridView.builder(
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
        ),
      ],
    );
  }
}
