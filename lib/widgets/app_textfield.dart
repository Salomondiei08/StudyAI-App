import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.labelText,
    required this.iconData,
    this.textController,
    this.obscureText = false,
    super.key,
  });
  final String labelText;
  final IconData iconData;
  final bool obscureText;
  final TextEditingController? textController;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3, 5), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        obscureText: obscureText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            floatingLabelStyle: const TextStyle(color: Colors.black),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.white,
            labelText: labelText,
            suffixIcon: Icon(
              iconData,
              color: Colors.black,
            )),
      ),
    );
  }
}
