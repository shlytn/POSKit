import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductAddButton extends StatelessWidget {
  const ProductAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashColor: Colors.transparent,
        iconSize: 24,
        padding: const EdgeInsets.all(0),
        color: Colors.white,
        onPressed: () {},
        icon: const Icon(CupertinoIcons.add),
    );
  }
}
