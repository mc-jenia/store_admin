import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_admin/providers/product_provider.dart';
import 'package:store_admin/screens/new_product.dart';
import 'package:store_admin/widgets/prodcut_item.dart';

import '../styles/colors.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = '/products';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .pushNamed(NewProduct.routeName, arguments: id),
            icon: const Icon(
              Icons.add_circle_outline,
              color: CustomColor.blue,
            ),
          )
        ],
        title: Text(
          'Products',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context).fetchAndSetProducts(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return Consumer<ProductProvider>(
              builder: (context, value, child) {
                if (value.products.isEmpty) {
                  return const Center(
                    child: Text(
                        'the Products is empty in this category try to added some'),
                  );
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: value.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 1,
                      crossAxisCount: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: CustomColor.cultured),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: ChangeNotifierProvider.value(
                            value: value.products[index],
                            child: const ProductItem(),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
