import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'text_field_container.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String hint;

  const PasswordField({Key? key, required this.label, required this.hint}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextFieldContainer(
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              suffixIcon: const Icon(CupertinoIcons.eye_slash)
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}