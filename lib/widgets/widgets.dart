import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget spacing(double height) {
  return SizedBox(
    height: height,
  );
}

showMessageSnackBar(BuildContext context, String message){
  final snackBar = SnackBar(
    content: Text(message),
  );
  ScaffoldMessenger.of(context)
      .showSnackBar(snackBar);
}