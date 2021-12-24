import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/provider/cart_provider.dart';
import 'package:dicoding_capstone_pos/ui/cart/order_detail.dart';
import 'package:dicoding_capstone_pos/widgets/cart_button.dart';
import 'package:dicoding_capstone_pos/widgets/cart_list.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
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
        title: const Text('Cart'),
      ),
      body: StreamProvider<List<CartItem>>.value(
        value: provider.getCart(),
        initialData: [],
        // updateShouldNotify: const ListEquality<CartItem>().equals,
        // catchError: (_, __) => [],
        child: Column(
          children: [
            spacing(8.0),
            const Expanded(
              child: ListViewCart(),
            ),
            const CartButton(
              route: OrderDetailPage.routeName,
            ),
            spacing(8.0),
          ],
        ),
      ),
    );
  }
}
