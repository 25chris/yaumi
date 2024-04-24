import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType textInputType;
  final String labelText;
  final int maxLines;
  final bool validate; // Whether to perform validation
  final Function(String)? onChanged;

  const InputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.inputFormatters,
    required this.textInputType,
    required this.labelText,
    this.maxLines = 1,
    this.onChanged,
    this.validate = false, // Default to no validation
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        validator: widget.validate ? _validateInput : null,
      ),
    );
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bagian ini wajib diisi!!!';
    }
    return null;
  }
}
