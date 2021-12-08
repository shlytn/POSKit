import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text_field_container.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hint;
  final TextInputType type;
  final ValueChanged<String> onChanged;

  const InputField({
    Key? key,
    required this.label,
    required this.hint,
    this.type = TextInputType.text,
    required this.onChanged,
  }) : super(key: key);

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
            keyboardType: widget.type,
            onChanged: widget.onChanged,
            inputFormatters: <TextInputFormatter>[
              widget.type == TextInputType.number
                  ? FilteringTextInputFormatter.digitsOnly
                  : FilteringTextInputFormatter.singleLineFormatter,
            ],
            validator: widget.type == TextInputType.emailAddress
                ? (value) => EmailValidator.validate(value!)
                    ? null
                    : "Please input a valid email."
                : null,
          ),
        ),
      ],
    );
  }
}
