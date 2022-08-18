import 'package:flutter/material.dart';

import '../styles/colors.dart';

class FormProduct extends StatelessWidget {
  const FormProduct({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.serialNumberController,
    required this.descriptionController,
    required this.priceController,
    required this.oldPriceController,
    required this.quantityController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController serialNumberController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController oldPriceController;
  final TextEditingController quantityController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: nameController,
            cursorColor: CustomColor.blue,
            validator: (value) {
              if (value!.isEmpty) {
                return 'you should add a name for product';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Product Name*',
              labelStyle: const TextStyle(
                color: CustomColor.blue,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.pastelRed,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: serialNumberController,
            cursorColor: CustomColor.blue,
            decoration: InputDecoration(
              labelText: 'Serial Number (optinal)',
              labelStyle: const TextStyle(
                color: CustomColor.blue,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.pastelRed,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: descriptionController,
            cursorColor: CustomColor.blue,
            maxLines: 3,
            validator: (value) {
              if (value!.isEmpty) {
                return 'you should add a description for product';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Description*',
              labelStyle: const TextStyle(
                color: CustomColor.blue,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.pastelRed,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: priceController,
            cursorColor: CustomColor.blue,
            validator: (value) {
              if (value!.isEmpty) {
                return 'you should add a price for product';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Price*',
              labelStyle: const TextStyle(
                color: CustomColor.blue,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.pastelRed,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: oldPriceController,
            cursorColor: CustomColor.blue,
            decoration: InputDecoration(
              labelText: 'old price (optinal)',
              labelStyle: const TextStyle(
                color: CustomColor.blue,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.pastelRed,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: quantityController,
            cursorColor: CustomColor.blue,
            decoration: InputDecoration(
              labelText: 'Available quantity in store',
              labelStyle: const TextStyle(
                color: CustomColor.blue,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.pastelRed,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColor.cultured,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
