import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_admin/models/category.dart';
import 'package:store_admin/providers/categories_provider.dart';
import 'package:store_admin/screens/products_screen.dart';

import '../styles/colors.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Category>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ListTile(
        onTap: () => Navigator.of(context)
            .pushNamed(ProductScreen.routeName, arguments: data.id),
        title: Center(
          child: Text(data.name),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: CustomColor.cultured,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: CustomColor.pastelRed,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do you want to remove category?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('NO'),
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<CategoriesProvider>(context, listen: false)
                            .deleteCategory(data.id)
                            .then(
                              (value) => Navigator.of(context).pop(true),
                            );
                      },
                      child: const Text('YES '),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
