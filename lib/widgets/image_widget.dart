import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/provider/image_picker_provider.dart';
import 'package:dicoding_capstone_pos/widgets/image_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<ImagePickerProvider>(context).image;

    final user = Provider.of<DocumentSnapshot?>(context);
    final imageUrl = user?["profile_image"];

    return Stack(
      children: [
        _buildImage(imageUrl, image),
        Positioned(bottom: 0, right: 5, child: _buildCameraButton(context))
      ],
    );
  }

  Widget _buildImage(String? url, File? image) {
    return ClipOval(
      child: url != null
          ? Image.network(url, width: 150.0, height: 150.0, fit: BoxFit.cover)
          : image != null
              ? Image.file(
                  image,
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/pp.jpg',
                  width: 150.0,
                  height: 150.0,
                ),
    );
  }

  Widget _buildCameraButton(BuildContext context) {
    return ClipOval(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: const Icon(
            CupertinoIcons.camera_fill,
            color: primaryColor,
          ),
          onTap: () async {
            showImageSource(context);
          },
        ),
      ),
    );
  }
}
