// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ListViewCart extends StatelessWidget {
  const ListViewCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<CartItem>>(context);

    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
          child: CartListItem(item: items[index]),
        );
      },
    );
  }
}
