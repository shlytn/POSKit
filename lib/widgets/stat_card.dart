import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final bool isProfit;
  final bool isIncrease;
  final String percentage;
  final String total;

  const StatCard({
    Key? key,
    required this.isProfit,
    required this.isIncrease,
    required this.percentage,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Color(isProfit ? 0XFFECF5EE : 0XFFCCF0FB);
    var iconColor = Color(isProfit
        ? isIncrease
            ? 0XFF458F5A
            : 0XFFBF4949
        : 0xFF00B2EB);

    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  isIncrease
                      ? CupertinoIcons.arrow_up_square_fill
                      : CupertinoIcons.arrow_down_square_fill,
                  color: iconColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RichText(
                    text: TextSpan(
                      text: isIncrease ? "+" : "-",
                      children: [
                        TextSpan(text: percentage),
                      ],
                      style: TextStyle(color: iconColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  total,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Text(
            isProfit ? "Total Profit" : "Total Transaction",
            style: const TextStyle(color: Color(0XFF737D93)),
          ),
        ],
      ),
    );
  }
}
