import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/widgets/stock_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StockList extends StatelessWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item> items = Provider.of<List<Item>>(context);

    items.sort((a, b) => a.stock!.compareTo(b.stock!));
    final filteredItems =
        items.where((e) => e.isManage && (e.stock! <= 3)).toList();

    if(filteredItems.isEmpty){
      return const Center(child: Text("No Data"));
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: StockCard(
            item: filteredItems[index],
          ),
        );
      },
      itemCount: filteredItems.length,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
    );
  }
}
