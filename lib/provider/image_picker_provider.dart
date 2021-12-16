import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerProvider extends ChangeNotifier {
  String _message = '';

  String get message => _message;

  File? _image;

  File? get image => _image;

  String _fileName = '';

  String get fileName => _fileName;

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      _image = imageTemporary;
      _fileName = basename(image.path);
      // final imagePermanent = await saveImagePermanently(image.path);
    } on PlatformException catch (e) {
      _message = 'Failed to pick Image $e';
    }
    notifyListeners();
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }
}