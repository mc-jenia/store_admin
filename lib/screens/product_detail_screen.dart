import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_admin/providers/product_provider.dart';
import 'package:store_admin/styles/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final loadedProduct = Provider.of<ProductProvider>(context).findById(id);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: mediaQuery.size.height * 0.4,
              pinned: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: CustomColor.blue,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text('Do you want to remove Product?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('NO'),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .deleteProduct(loadedProduct.id);
                                Navigator.of(context).pop(true);
                              },
                              child: const Text('YES '),
                            ),
                          ],
                        );
                      },
                    ).then((value) {
                      Navigator.of(context).pop(context);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: CustomColor.pastelRed,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: loadedProduct.id!,
                  child: Image.network(
                    loadedProduct.imageUrl,
                    fit: BoxFit.contain,
                    height: mediaQuery.size.height * 0.4,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loadedProduct.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        loadedProduct.serialNumber == null
                            ? Container()
                            : Text(
                                loadedProduct.serialNumber!,
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${loadedProduct.price.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            loadedProduct.oldPrice == null ||
                                    loadedProduct.oldPrice!.isNaN
                                ? Container()
                                : Text(
                                    '\$${loadedProduct.oldPrice!.toStringAsFixed(2)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: CustomColor.pastelRed),
                                  ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          loadedProduct.description,
                          softWrap: true,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
