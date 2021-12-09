import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? textColor;
  final Color? iconColor;
  final double? textSize;
  final double? iconSize;

  const CustomText({
    Key? key,
    required this.text,
    required this.icon,
    this.textColor,
    this.textSize,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
