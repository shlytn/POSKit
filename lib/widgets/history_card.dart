import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat("#,##0.00", "en_US");
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rp. ${formatCurrency.format(100000)}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RichText(
                text: const TextSpan(
                    text: "10.00 AM",
                    children: [
                      TextSpan(text: " - "),
                      TextSpan(text: "#TRX0101211113"),
                    ],
                    style: TextStyle(color: Colors.black)),
              )
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("PAID OFF"),
            style: ElevatedButton.styleFrom(
              primary: secondaryColor,
              onPrimary: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
