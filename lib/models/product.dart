import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String categoryId;
  final String name;
  final String? serialNumber;
  final String description;
  final double price;
  final double? oldPrice;
  final int availableQunantity;
  final String imageUrl;

  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    this.serialNumber,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.availableQunantity,
    required this.imageUrl,
  });

  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final id = snapshot.id;
    final data = snapshot.data();
    return Product(
      id: id,
      categoryId: data?['categoryId'],
      name: data?['name'],
      serialNumber: data?['serialNumber'],
      description: data?['description'],
      price: data?['price'],
      oldPrice: data?['oldPrice'],
      availableQunantity: data?['availableQunantity'],
      imageUrl: data?['imageUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'categoryId': categoryId,
      'name': name,
      if (serialNumber != null) 'serialNumber': serialNumber,
      'description': description,
      'price': price,
      if (oldPrice != null) 'oldPrice': oldPrice,
      'availableQunantity': availableQunantity,
      'imageUrl': imageUrl
    };
  }
}
