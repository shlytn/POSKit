import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'text_field_container.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String hint;

  const PasswordField({Key? key, required this.label, required this.hint})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextFieldContainer(
          child: TextFormField(
            obscureText: !isVisible,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              suffixIcon: IconButton(
                icon: Icon(
                    isVisible ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}