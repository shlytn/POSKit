import 'package:dicoding_capstone_pos/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageField extends StatelessWidget {
  final String buttonText;
  var imageName = '';

  ImageField({Key? key, required this.buttonText}) : super(key: key);

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
          CustomText(
            text: imageName,
            icon: CupertinoIcons.photo,
            textColor: Colors.black,
            iconSize: 50.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
