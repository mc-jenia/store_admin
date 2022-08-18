import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_admin/models/product.dart';

class ProductProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance.collection('products').withConverter(
        fromFirestore: Product.fromFirestore,
        toFirestore: (Product product, option) => product.toFirestore(),
      );

  List<Product> _products = [];

  List<Product> get products {
    return [..._products];
  }

  Product findById(id) {
    return _products.firstWhere((element) => element.id == id);
  }

  Future<void> fetchAndSetProducts(id) async {
    await _db
        .where(
          'categoryId',
          isEqualTo: id,
        )
        .get()
        .then((products) {
      List<Product> loadedProducts = [];
      for (var product in products.docs) {
        loadedProducts.add(product.data());
      }
      _products = loadedProducts;
    });
  }
}
