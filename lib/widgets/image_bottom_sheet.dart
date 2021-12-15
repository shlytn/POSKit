import 'package:dicoding_capstone_pos/widgets/bottom_sheet_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
        children: const [
          BottomSheetButton(
            text: "Camera",
            icon: CupertinoIcons.camera,
            source: ImageSource.camera,
          ),
          BottomSheetButton(
            text: "Gallery",
            icon: CupertinoIcons.photo,
            source: ImageSource.gallery,
          ),
        ],
      );
    },
  );
}
