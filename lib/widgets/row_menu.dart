import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowMenu extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;
  final Function onClick;

  const RowMenu({
    Key? key,
    required this.title,
    required this.padding,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
