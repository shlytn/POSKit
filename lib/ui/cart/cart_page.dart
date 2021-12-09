// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dicoding_capstone_pos/ui/cart/order_detail.dart';
import 'package:dicoding_capstone_pos/widgets/cart_button.dart';
import 'package:dicoding_capstone_pos/widgets/list_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isListView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Expanded(
            child: ListViewCart(),
          ),
          CartButton(
            route: OrderDetailPage.routeName,
          ),
          SizedBox(height: 8.0)
        ],
      ),
    );
  }
}
