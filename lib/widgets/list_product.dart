// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/ui/list/add_update_product_page.dart';
import 'package:dicoding_capstone_pos/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListViewProduct extends StatelessWidget {
  const ListViewProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 4,
      itemBuilder: (context, index) {
        return CardProduct();
      },
    );
  }
}
