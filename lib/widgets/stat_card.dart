import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final bool isIncome;
  final String total;

  const StatCard({
    Key? key,
    required this.isIncome,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Color(isIncome ? 0XFF458F5A : 0xFF00B2EB);

    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isIncome ? "Total Income" : "Total Transaction",
            style: TextStyle(color: color),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                total,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
