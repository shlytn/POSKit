import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailItem extends StatelessWidget {
  final CartItem item;
  const OrderDetailItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = item.quantity * item.item.sellingPrice;
    final formatCurrency = NumberFormat("#,##0", "en_US");

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryColor),
              child: Center(
                child: Text(
                  item.quantity.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 25.0),
            Text(item.item.name),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Rp. ${formatCurrency.format(total)}"),
            )
          ],
        ),
      ],
    );
  }
}
