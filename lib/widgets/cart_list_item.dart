import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  final CartItem item;

  const CartListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/food.jpg'),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.item.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '(must choose level)',
                    style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.inactiveGray),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    item.item.sellingPrice.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: secondaryColor),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding:
              const EdgeInsets.only(left: 1, right: 20.0, top: 25),
              child: Container(
                height: 32.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryColor),
                child: Row(
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      iconSize: 16,
                      padding: const EdgeInsets.all(0),
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.minus),
                    ),
                    Text(
                      item.quantity.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      iconSize: 16,
                      padding: const EdgeInsets.all(0),
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.add),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}