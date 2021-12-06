import 'package:flutter/material.dart';

import 'text_field_container.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hint;

  const InputField({Key? key, required this.label, required this.hint}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextFieldContainer(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}