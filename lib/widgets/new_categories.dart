import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_admin/providers/categories_provider.dart';
import 'package:store_admin/styles/colors.dart';

class NewCategories extends StatefulWidget {
  const NewCategories({Key? key}) : super(key: key);

  @override
  State<NewCategories> createState() => _NewCategoriesState();
}

class _NewCategoriesState extends State<NewCategories> {
  final categoryController = TextEditingController();
  bool isLoading = false;

  void addCategory() async {
    setState(() {
      isLoading = true;
    });
    if (categoryController.text.isNotEmpty) {
      await Provider.of<CategoriesProvider>(context, listen: false)
          .createCategories(categoryController.text)
          .then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add a new category ',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: categoryController,
            cursorColor: CustomColor.blue,
            onSubmitted: (value) => addCategory(),
            decoration: InputDecoration(
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: CustomColor.gray),
              hintText: 'Write a new category',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: CustomColor.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: CustomColor.cultured),
              ),
            ),
          ),
          const SizedBox(height: 10),
          isLoading
              ? const CircularProgressIndicator.adaptive()
              : ElevatedButton(
                  onPressed: () => addCategory(),
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
                )
        ],
      ),
    );
  }
}
