import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/provider/cart_provider.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductAddButton extends StatelessWidget {
  final Item item;

  const ProductAddButton({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);

    return IconButton(
        splashColor: Colors.transparent,
        iconSize: 24,
        padding: const EdgeInsets.all(0),
        color: Colors.white,
        onPressed: () async {
          await provider.addCart(item);

          showMessageSnackBar(context, provider.message);
        },
        icon: const Icon(CupertinoIcons.add),
    );
  }
}
