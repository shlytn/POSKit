import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

   const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: Stack(fit: StackFit.loose, children: [
        Positioned(
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
        GFIconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.pop(context),
          borderShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ]),
    );
  }
}
