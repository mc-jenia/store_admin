import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance.collection('categories').withConverter(
        fromFirestore: Category.fromFirestore,
        toFirestore: (Category categories, options) => categories.toFirestore(),
      );

  List<Category> _categories = [];

  List<Category> get categories {
    return [..._categories];
  }

  //fetch data for categories from server
  Future<void> fetchAndSetCategories() async {
    final categories = await _db.get();
    List<Category> loadedCategories = [];
    for (var category in categories.docs) {
      loadedCategories.add(category.data());
    }
    _categories = loadedCategories;
  }

  //add new categories to server
  Future<void> createCategories(name) async {
    final newCategoires = Category(name: name);
    await _db.add(newCategoires);
    notifyListeners();
  }

  Future<void> deleteCategory(id) async {
    await _db.doc(id).delete().then((value) {
      _categories.removeWhere((element) => element.id == id);
      notifyListeners();
    });
  }
}
