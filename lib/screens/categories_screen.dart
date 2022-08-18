import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_admin/providers/categories_provider.dart';
import 'package:store_admin/widgets/new_categories.dart';
import '../styles/colors.dart';
import '../widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  void _startAddNewCategory(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return const NewCategories();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _startAddNewCategory(context),
            icon: const Icon(
              Icons.add_circle_outline,
              color: CustomColor.blue,
            ),
          )
        ],
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder(
        future:
            Provider.of<CategoriesProvider>(context).fetchAndSetCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return const ProductsListView();
          }
        },
      ),
    );
  }
}

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CategoriesProvider>(context).categories;
    return data.isEmpty
        ? const Center(
            child: Text('the Categoires is empty try to added some'),
          )
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: data[index],
                child: const CategoriesItem(),
              );
            },
          );
  }
}
