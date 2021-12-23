import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/history.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  final History history;

  const HistoryCard({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat("#,##0.00", "en_US");
    final date = DateFormat("EEEE, dd MM yyyy").format(history.dateTime);
    final time = DateFormat("hh:mm a").format(history.dateTime);

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
              Text(date),
              spacing(8.0),
              Text(
                "Rp. ${formatCurrency.format(history.totalPrice)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                    text: time,
                    children: [
                      const TextSpan(text: " - "),
                      TextSpan(text: "${history.id}"),
                    ],
                    style: const TextStyle(color: Colors.black)),
              )
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: null,
            child: const Text("PAID"),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
