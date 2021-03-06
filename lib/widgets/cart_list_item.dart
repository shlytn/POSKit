import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/provider/cart_provider.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CartListItem extends StatelessWidget {
  final CartItem item;

  const CartListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    final totalPrice = item.item.sellingPrice * item.quantity;
    final formatCurrency = NumberFormat("#,##0", "en_US");

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) async {
              await provider.deleteCart(item.id!);

              showMessageSnackBar(context, provider.message);
            },
            icon: CupertinoIcons.delete,
            foregroundColor: Colors.red,
            backgroundColor: background,
          ),
        ],
        extentRatio: 1 / 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: item.item.imageUrl != null
                    ? Image.network(
                        item.item.imageUrl!,
                        height: 100.0,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/food.jpg',
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "Rp. ${formatCurrency.format(totalPrice)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: secondaryColor),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 32.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryColor),
              margin: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    iconSize: 16,
                    padding: const EdgeInsets.all(0),
                    color: Colors.white,
                    onPressed: () async {
                      await provider.updateCart(item.id!, item, false);
                    },
                    icon: const Icon(CupertinoIcons.minus),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    splashColor: Colors.red,
                    iconSize: 16,
                    padding: const EdgeInsets.all(0),
                    color: Colors.white,
                    onPressed: () async {
                      await provider.updateCart(item.id!, item, true);
                    },
                    icon: const Icon(CupertinoIcons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
