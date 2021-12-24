import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text_field_container.dart';

class InputField extends StatefulWidget {
  final String label;
  final String? text;
  final String hint;
  final TextInputType type;
  final ValueChanged<String>? onChanged;
  final bool isEnable;
  final bool validate;
  final Color textColor;

  const InputField({
    Key? key,
    required this.label,
    this.text,
    required this.hint,
    this.type = TextInputType.text,
    this.onChanged,
    this.isEnable = true,
    this.validate = true,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextFieldContainer(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _controller,
            enabled: widget.isEnable,
            cursorColor: Colors.blue,
            textCapitalization: widget.type == TextInputType.text
                ? TextCapitalization.words
                : TextCapitalization.none,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: const TextStyle(color: Colors.black38),
            ),
            style: TextStyle(color: widget.textColor),
            keyboardType: widget.type,
            onChanged: widget.onChanged,
            inputFormatters: <TextInputFormatter>[
              widget.type == TextInputType.number
                  ? FilteringTextInputFormatter.digitsOnly
                  : FilteringTextInputFormatter.singleLineFormatter,
            ],
            validator: widget.validate
                ? widget.type == TextInputType.emailAddress
                    ? (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please input a valid email."
                    : (value) {
                        if (value == null || value.isEmpty || value.trim() == '') {
                          return "Please input ${widget.label}";
                        }
                      }
                : null,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
