import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_admin/providers/product_provider.dart';
import 'package:store_admin/styles/colors.dart';
import '../widgets/form_new_product.dart';
import '../widgets/image_pick_new_product.dart';

class NewProduct extends StatefulWidget {
  static const routeName = '/new-product';
  const NewProduct({Key? key}) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final serialNumberController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final oldPriceController = TextEditingController();
  final quantityController = TextEditingController();
  File? productImageFile;

  takeImage(imagePath) {
    productImageFile = imagePath;
  }

  Future<void> _submit(categoryId, ctx) async {
    FocusScope.of(context).unfocus();
    if (productImageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('image most not be empty'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
    if (_formKey.currentState!.validate() && productImageFile != null) {
      setState(() {
        isLoading = true;
      });
      _formKey.currentState!.save();
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('prodcuts')
          .child(nameController.text);
      await storageRef.putFile(productImageFile!);
      final url = await storageRef.getDownloadURL();
      await Provider.of<ProductProvider>(ctx, listen: false)
          .addNewProduct(
        categoryId,
        nameController.text,
        serialNumberController.text,
        descriptionController.text,
        double.parse(priceController.text),
        oldPriceController.text.isEmpty
            ? double.nan
            : double.parse(oldPriceController.text),
        int.parse(quantityController.text),
        url,
      )
          .then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    final catId = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Product '),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          FormProduct(
            formKey: _formKey,
            nameController: nameController,
            serialNumberController: serialNumberController,
            descriptionController: descriptionController,
            priceController: priceController,
            oldPriceController: oldPriceController,
            quantityController: quantityController,
          ),
          const SizedBox(height: 20),
          ImagePick(image: takeImage),
          const SizedBox(height: 20),
          isLoading
              ? const CircularProgressIndicator.adaptive()
              : ElevatedButton(
                  onPressed: () => _submit(catId, context),
                  style: ElevatedButton.styleFrom(
                    primary: CustomColor.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Add'),
                ),
        ],
      ),
    );
  }
}
