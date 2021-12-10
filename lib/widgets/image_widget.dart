import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImage(),
        Positioned(bottom: 0, right: 5, child: _buildCameraButton())
      ],
    );
  }

  Widget _buildImage() {
    return ClipOval(
      child: Image.asset(
        'assets/images/pp.jpg',
        width: 150.0,
        height: 150.0,
      ),
    );
  }

  Widget _buildCameraButton() {
    return ClipOval(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Icon(
            CupertinoIcons.camera_fill,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
