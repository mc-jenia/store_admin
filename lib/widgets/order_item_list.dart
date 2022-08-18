import 'package:flutter/material.dart';

import '../styles/colors.dart';

class OrderItemList extends StatelessWidget {
  const OrderItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.3,
                    child: const FittedBox(
                      child: Text('Order No 123'),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.2,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.25,
                    child: FittedBox(
                      child: Text(
                        'Total Amount',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: CustomColor.gray),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.25,
                    child: FittedBox(
                      child: Text(
                        '\$52.97',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.05,
            ),
            SizedBox(
              width: constraints.maxWidth * 0.3,
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.5,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.25,
                    child: FittedBox(
                      child: Text(
                        'Status',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: CustomColor.gray,
                                ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.25,
                    child: FittedBox(
                      child: Text(
                        'Open',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: CustomColor.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.05,
            ),
            SizedBox(
              width: constraints.maxWidth * 0.3,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  color: CustomColor.blue,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
