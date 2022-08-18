import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({Key? key, required this.image}) : super(key: key);
  final Function image;

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  final ImagePicker _picker = ImagePicker();
  File? image;

  void getFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = File(photo!.path);
    });
    widget.image(image);
  }

  void getFromGallry() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(photo!.path);
    });
    widget.image(image);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
              height: 150,
              width: constraints.maxWidth * 0.50,
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: image == null
                    ? Image.network(
                        'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg')
                    : Image.file(image!),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.05,
            ),
            SizedBox(
              width: constraints.maxWidth * 0.45,
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () => getFromGallry(),
                    icon: const Icon(
                      CupertinoIcons.photo,
                    ),
                    label: const Text('Gallery'),
                  ),
                  TextButton.icon(
                    onPressed: () => getFromCamera(),
                    icon: const Icon(
                      CupertinoIcons.camera,
                    ),
                    label: const Text('Camera'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
