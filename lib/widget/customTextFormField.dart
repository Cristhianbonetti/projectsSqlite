import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(label),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label não pode ser vazio';
          }
        },
      ),
    );
  }
}
