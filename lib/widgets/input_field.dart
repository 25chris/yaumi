import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType textInputType;
  final String labelText;
  final int maxLines;
  final Function(String)? onChanged;

  InputField(
      {required this.controller,
      required this.hintText,
      required this.inputFormatters,
      required this.textInputType,
      required this.labelText,
      this.maxLines = 1,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(), // Added border here
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
