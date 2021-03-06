import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onClick;
  final String text;
  final bool isEnable;

  const RoundedButton({
    Key? key,
    required this.onClick,
    required this.text,
    this.isEnable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => isEnable ? onClick() : null,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56.0),
        primary: isEnable ? secondaryColor : Colors.grey,
        onPrimary: onSecondary,
        textStyle: const TextStyle(fontSize: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
