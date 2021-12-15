import 'dart:io';

import 'package:dicoding_capstone_pos/provider/image_picker_provider.dart';
import 'package:dicoding_capstone_pos/widgets/icon_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ImageField extends StatefulWidget {
  final String buttonText;

  const ImageField({Key? key, required this.buttonText}) : super(key: key);

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ImagePickerProvider>(context);
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
            child: IconText(
              text: provider.fileName,
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
