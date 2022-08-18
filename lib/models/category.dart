import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Category with ChangeNotifier {
  final String? id;
  final String name;

  Category({
    this.id,
    required this.name,
  });

  factory Category.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final id = snapshot.id;
    final data = snapshot.data();
    return Category(
      id: id,
      name: data?['name'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
    };
  }
}
