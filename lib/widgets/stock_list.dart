import 'package:dicoding_capstone_pos/widgets/stock_card.dart';
import 'package:flutter/cupertino.dart';

class StockList extends StatelessWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: StockCard(),
        );
      },
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
    );
  }
}
