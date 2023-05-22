import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AddCardTextField extends StatelessWidget {
  const AddCardTextField({
    required this.labelText,
    this.textController,
    this.obscureText = false,
    super.key,
  });
  final String labelText;
  final bool obscureText;
  final TextEditingController? textController;
  final Color color = const Color(0xFF27354B);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: TextField(
        controller: textController,
        obscureText: obscureText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: color),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          fillColor: Colors.white,
          labelText: labelText,
          labelStyle: kDisplayArticleH1,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: color,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
