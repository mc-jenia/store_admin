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

  Future<void> addNewProduct(
      String categoryId,
      String name,
      String serialNumber,
      String description,
      double price,
      double oldPrice,
      int availableQunantity,
      String imageUrl) async {
    final newProduct = Product(
      categoryId: categoryId,
      name: name,
      serialNumber: serialNumber,
      description: description,
      price: price,
      oldPrice: oldPrice,
      availableQunantity: availableQunantity,
      imageUrl: imageUrl,
    );
    await _db.add(newProduct);
    notifyListeners();
  }

  Future<void> deleteProduct(id) async {
    await _db.doc(id).delete().then((value) {
      _products.removeWhere((element) => element.id == id);
    });
    notifyListeners();
  }
}
