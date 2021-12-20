import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/provider/database_provider.dart';
import 'package:dicoding_capstone_pos/utils/result_state.dart';
import 'package:dicoding_capstone_pos/widgets/empty_widget.dart';
import 'package:dicoding_capstone_pos/widgets/product_grid_card.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<Item>>(context);

    return Consumer<DatabaseProvider>(builder: (context, provider, _) {
      if (provider.state == ResultState.error) {
        return const Center(child: Text("Ups, something went wrong!"));
      } else if (provider.state == ResultState.noData) {
        return const Center(child: EmptyWidget());
      } else if (provider.state == ResultState.hasData) {
        return GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 10 / 15),
          itemBuilder: (context, index) {
            return GridProductCard(
              item: items[index],
            );
          },
        );
      }

      return const CircularProgressIndicator();
    });
  }
}
