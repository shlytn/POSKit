import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child:
          Stack(
              fit: StackFit.loose,
              children: [
          GFIconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(context),
            borderShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        // ),
        Expanded(
          child: SizedBox(
            height: 45.0,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
