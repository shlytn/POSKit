import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/provider/cart_provider.dart';
import 'package:dicoding_capstone_pos/widgets/cart_list_item.dart';
import 'package:dicoding_capstone_pos/widgets/check_state.dart';
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

    return Consumer<CartProvider>(builder: (context, provider, _) {
      return CheckState(
        provider: provider,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
              child: CartListItem(item: items[index]),
            );
          },
        ),
      );
    });
  }
}
