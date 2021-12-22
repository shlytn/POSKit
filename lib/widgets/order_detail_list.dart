import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/provider/cart_provider.dart';
import 'package:dicoding_capstone_pos/widgets/check_state.dart';
import 'package:dicoding_capstone_pos/widgets/order_detail_item.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailList extends StatelessWidget {
  const OrderDetailList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<CartItem>>(context);

    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return CheckState(
          provider: provider,
          child: Column(
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
                  const Text('Discount', style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: 9,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 9,
                      ),
                    ),
                  ),
                ],
              ),
              spacing(8.0),
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
                    '\$10.99',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              spacing(8.0),
              const Divider(),
              spacing(8.0),
              Center(
                child: TextButton.icon(
                  style:
                      TextButton.styleFrom(primary: CupertinoColors.systemRed),
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.trash),
                  label: const Text('Delete Order'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
