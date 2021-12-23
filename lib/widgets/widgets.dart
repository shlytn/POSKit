import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget spacing(double height) {
  return SizedBox(
    height: height,
  );
}

showMessageSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showInfoDialog({
  required BuildContext context,
  required String title,
  required String desc,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    animType: AnimType.SCALE,
    title: title,
    desc: desc,
    autoHide: const Duration(seconds: 3),
  ).show();
}
