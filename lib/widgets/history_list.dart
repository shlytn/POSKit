import 'package:dicoding_capstone_pos/widgets/history_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListHistory extends StatelessWidget {
  const ListHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Monday, 02 November 2021"),
            Text("Rp 300.000", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: HistoryCard(),
            );
          },
          itemCount: 3,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
        ),
      ],
    );
  }
}
