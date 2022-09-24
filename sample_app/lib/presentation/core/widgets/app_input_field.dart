import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? hint;
  final TextInputType? textInputType;

  const AppInputField(
      {this.controller,
        // this.controller,
        this.textInputType,
        required this.label,
        this.hint,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      controller: controller,
    );
  }
}
