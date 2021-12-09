import 'dart:io';

import 'package:dicoding_capstone_pos/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImageField extends StatefulWidget {
  final String buttonText;

  ImageField({Key? key, required this.buttonText}) : super(key: key);

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  var imageName = '';
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      imageName = basename(image.path);
      // final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick Image $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    // print("image = $image");
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomText(
              text: imageName,
              icon: CupertinoIcons.photo,
              textColor: Colors.black,
              iconSize: 50.0,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showImageSource(context);
            },
            child: Text(widget.buttonText),
          ),
        ],
      ),
    );
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextButton(context,
                "Camera", CupertinoIcons.camera, ImageSource.camera),
            _buildTextButton(context,
                "Gallery", CupertinoIcons.photo, ImageSource.gallery),
          ],
        );
      },
    );
  }

  Widget _buildTextButton(BuildContext context, String text, IconData icon, ImageSource source) {
    var width = MediaQuery.of(context).size.width * 0.49;
    return SizedBox(
      height: 120.0,
      width: width,
      child: TextButton(
          onPressed: () => pickImage(source),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
                  children: [
                Icon(icon, size: 35.0, color: Colors.blueGrey,),
                Text(text, style: const TextStyle(color: Colors.blueGrey),)
              ],
            ),
      ),
    );
  }
}
