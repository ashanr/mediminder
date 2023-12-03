import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const LabeledTextField({super.key, 
    required this.label,
    this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
