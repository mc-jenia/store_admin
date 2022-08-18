import 'package:flutter/material.dart';

class NewProduct extends StatelessWidget {
  static const routeName = '/new-product';
  const NewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Product '),
      ),
    );
  }
}
