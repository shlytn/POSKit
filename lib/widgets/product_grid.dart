import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/provider/database_provider.dart';
import 'package:dicoding_capstone_pos/widgets/check_state.dart';
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
      return CheckState(
        provider: provider,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0
          ),
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 10 / 15),
            itemBuilder: (context, index) {
              return GridProductCard(
                item: items[index],
              );
            },
          ),
        ),
      );
    });
  }
}
