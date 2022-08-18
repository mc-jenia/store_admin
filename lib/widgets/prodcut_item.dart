import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_admin/models/product.dart';
import 'package:store_admin/screens/product_detail_screen.dart';

import '../providers/product_provider.dart';
import '../styles/colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Product>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: data.id);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.3,
                child: Hero(
                  tag: data.id!,
                  child: Image.network(
                    data.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.05,
              ),
              SizedBox(
                width: constraints.maxWidth * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.3,
                      child: FittedBox(
                        child: Text(
                          data.name,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.3,
                      child: Row(
                        children: [
                          FittedBox(
                            child: Text('\$${data.price}'),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.05,
                          ),
                          data.oldPrice == null || data.oldPrice!.isNaN
                              ? Container()
                              : FittedBox(
                                  child: Text(
                                    '\$${data.oldPrice}',
                                    style: const TextStyle(
                                      color: CustomColor.pastelRed,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.4,
                      child: Row(
                        children: [
                          FittedBox(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: CustomColor.blue,
                              ),
                            ),
                          ),
                          FittedBox(
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      title: const Text('Are you sure?'),
                                      content: const Text(
                                          'Do you want to remove Product?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text('NO'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Provider.of<ProductProvider>(
                                                    context,
                                                    listen: false)
                                                .deleteProduct(data.id)
                                                .then(
                                                  (value) =>
                                                      Navigator.of(context)
                                                          .pop(true),
                                                );
                                          },
                                          child: const Text('YES '),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: CustomColor.pastelRed,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
