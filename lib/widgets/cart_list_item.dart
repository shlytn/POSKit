import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartListItem extends StatelessWidget {
  final CartItem item;

  const CartListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {},
            icon: CupertinoIcons.delete,
            foregroundColor: Colors.red,
            backgroundColor: background,
          ),
        ],
        extentRatio: 1/5,
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
                child: Image.asset('assets/images/food.jpg', fit: BoxFit.cover),
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
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      item.item.sellingPrice.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: secondaryColor),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
