import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/provider/database_provider.dart';
import 'package:dicoding_capstone_pos/widgets/check_state.dart';
import 'package:dicoding_capstone_pos/widgets/empty_widget.dart';
import 'package:dicoding_capstone_pos/widgets/product_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ListViewProduct extends StatelessWidget {
  const ListViewProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<Item>>(context);

    if(items.isEmpty){
      return const Center(child: EmptyWidget());
    }

    return Consumer<DatabaseProvider>(builder: (context, provider, _) {
      return CheckState(
        provider: provider,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CardProduct(item: items[index]);
          },
        ),
      );
    });
  }
}
