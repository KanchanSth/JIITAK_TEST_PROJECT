import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;

  const CustomText(
      {super.key,
      this.color,
      this.fontWeight,
      this.size,
      required this.text,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
          overflow: overflow),
    );
  }
}

class RequiredText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;

  const RequiredText(
      {super.key,
      this.color,
      this.fontWeight,
      this.size,
      required this.text,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 5),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                const TextSpan(
                  text: '*',
                  style: TextStyle(
                      color: Color.fromARGB(255, 235, 83, 8), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
