import 'package:flutter/material.dart';
import 'package:test_project/core/app/dimensions.dart';

class StoreDetailsFormWidget extends StatelessWidget {
  const StoreDetailsFormWidget(
      {super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                const TextSpan(
                  text: '*',
                  style: TextStyle(
                      color: Color.fromARGB(255, 235, 83, 8), fontSize: 14),
                ),
              ],
            ),
          ),
          vSizedBox1,
          TextFormField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: data,
              hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 217, 219, 233),
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.grey, width: 0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
