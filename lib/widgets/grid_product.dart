import 'package:dicoding_capstone_pos/widgets/grid_product_card.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 10 / 15),
      itemBuilder: (context, index) {
        return const GridProductCard();
      },
    );
  }
}
