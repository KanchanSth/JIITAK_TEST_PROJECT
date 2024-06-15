import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextDropdownButton extends StatelessWidget {
  final TextEditingController controller;
  final List<String> items;

  CustomTextDropdownButton({required this.controller, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color.fromARGB(255, 231, 231, 231),
        ),
      ),
      child: DropdownButton<String>(
        value: controller.text.isEmpty ? null : controller.text,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.text = newValue;
          }
        },
        underline: const SizedBox(),
        icon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset('assets/icons/dropdown.svg'),
        ),
      ),
    );
  }
}
