import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/widgets/order_detail_item.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryDetailList extends StatelessWidget {
  final List<CartItem> items;
  final int totalPrice;

  const HistoryDetailList({
    Key? key,
    required this.items, required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat("#,##0", "en_US");

    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return OrderDetailItem(item: items[index]);
          },
        ),
        const Divider(),
        spacing(8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Subtotal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "Rp. ${formatCurrency.format(totalPrice)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        spacing(8.0),
        const Divider(),
        spacing(8.0),
      ],
    );
  }
}
