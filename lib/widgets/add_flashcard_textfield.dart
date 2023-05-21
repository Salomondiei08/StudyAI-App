import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AddCardTextField extends StatelessWidget {
  const AddCardTextField({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        decoration: InputDecoration(
            floatingLabelStyle: const TextStyle(color: Color(0xFF27354B)),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF27354B),
                style: BorderStyle.solid,
              ),
            ),
            labelText: label,
            labelStyle:
                kDisplayArticleH1.copyWith(color: const Color(0xFF27354B))),
      ),
    );
  }
}
