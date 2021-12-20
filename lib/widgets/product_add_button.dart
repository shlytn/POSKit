import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductAddButton extends StatelessWidget {
  final Item item;

  const ProductAddButton({Key? key, required this.item}) : super(key: key);

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
