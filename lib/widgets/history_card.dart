import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {

  const HistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const Text("Rp 100.000,00", style: TextStyle(fontWeight: FontWeight.bold),),
              RichText(
                text: const TextSpan(text: "10.00 AM", children: [
                  TextSpan(text: " - "),
                  TextSpan(text: "#TRX0101211113"),
                ], style: TextStyle(color: Colors.black)),
              )
            ],
          ),
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
