import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/provider/image_picker_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BottomSheetButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final ImageSource source;

  const BottomSheetButton(
      {Key? key, required this.text, required this.icon, required this.source})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ImagePickerProvider>(context);
    var width = MediaQuery.of(context).size.width * 0.49;

    return SizedBox(
      height: 120.0,
      width: width,
      child: TextButton(
        onPressed: () => provider.pickImage(source),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              size: 35.0,
              color: secondaryColor,
            ),
            Text(
              text,
              style: const TextStyle(color: secondaryColor),
            )
          ],
        ),
      ),
    );
  }
}
