import 'package:flutter/material.dart';

class AppDropDowwn extends StatelessWidget {
  const AppDropDowwn(
      {super.key,
      required this.dropdownvalue,
      this.onChanged,
      required this.itemList,
      required this.hintText});

  final String dropdownvalue;
  final void Function(String?)? onChanged;
  final List<String> itemList;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.black),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3, 5), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      child: DropdownButton(
        hint: Text(hintText),
        underline: const SizedBox(),
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
        elevation: 4,
        value: dropdownvalue,
        items: itemList
            .map((items) => DropdownMenuItem(child: Text(items), value: items))
            .toList(),
        onChanged: onChanged,
        icon: const Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
