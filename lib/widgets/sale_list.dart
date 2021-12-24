import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/widgets/sale_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SaleList extends StatelessWidget {
  const SaleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = List.from(Provider.of<List<Item>>(context));

    items.sort((b, a) => a.sold!.compareTo(b.sold!));

    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: SaleCard(
            item: items[index],
          ),
        );
      },
      itemCount: items.length >= 3
          ? 3
          : items.isNotEmpty
              ? items.length
              : 0,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }
}
