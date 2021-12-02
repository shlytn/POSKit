// ignore_for_file: prefer_const_constructors

import 'package:capstone/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewFood extends StatelessWidget {
  const GridViewFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String foodName = 'Salad Tuna';
    double price = 10.99;
    return GridView.builder(
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 10 / 15),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/food.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        '(must choose level)',
                        style: TextStyle(
                            fontSize: 12, color: CupertinoColors.inactiveGray),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$' + price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: onPrimary,
                                fontSize: 16),
                          ),
                          Container(
                            width: 31.0,
                            height: 29.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: onPrimary),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              iconSize: 20,
                              padding: const EdgeInsets.all(0),
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(CupertinoIcons.add),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
