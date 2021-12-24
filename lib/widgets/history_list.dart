import 'package:dicoding_capstone_pos/data/models/history.dart';
import 'package:dicoding_capstone_pos/widgets/empty_widget.dart';
import 'package:dicoding_capstone_pos/widgets/history_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListHistory extends StatelessWidget {
  const ListHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<List<History>>(context);

    if(history.isEmpty){
      return const Center(child: EmptyWidget());
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: HistoryCard(history: history[index],),
              );
            },
            itemCount: history.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
