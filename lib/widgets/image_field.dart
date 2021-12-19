import 'package:dicoding_capstone_pos/widgets/icon_text.dart';
import 'package:dicoding_capstone_pos/widgets/image_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageField extends StatelessWidget {
  final String buttonText;
  final String fileName;

  const ImageField({
    Key? key,
    required this.buttonText,
    required this.fileName,
  }) : super(key: key);

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
            child: IconText(
              text: fileName,
              icon: CupertinoIcons.photo,
              textColor: Colors.black,
              iconSize: 50.0,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showImageSource(context);
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
