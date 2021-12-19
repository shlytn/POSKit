// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/provider/cart_provider.dart';
import 'package:dicoding_capstone_pos/ui/cart/order_detail.dart';
import 'package:dicoding_capstone_pos/widgets/cart_button.dart';
import 'package:dicoding_capstone_pos/widgets/cart_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final provider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Cart'),
      ),
      body: StreamProvider<List<CartItem>>.value(
        value: provider.getCart(),
        initialData: [],
        child: Column(
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
      ),
    );
  }
}
