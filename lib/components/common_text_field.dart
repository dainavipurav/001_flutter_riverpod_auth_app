import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  const CommonTextField({
    super.key,
    required this.label,
    required this.textEditingController,
    required this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        controller: textEditingController,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        validator: (value) {
          if (value == null ||
              value.toString().isEmpty ||
              value.toString().trim() == '') {
            return '$label can\'t be empty';
          }
          return null;
        },
      ),
    );
  }
}
