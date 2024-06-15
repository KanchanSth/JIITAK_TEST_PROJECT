import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/core/app/dimensions.dart';

class StoreDetailsFormWidget extends StatelessWidget {
  const StoreDetailsFormWidget(
      {super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
                TextSpan(
                  text: '*',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 235, 83, 8),
                      fontSize: 14.sp),
                ),
              ],
            ),
          ),
          vSizedBox1,
          TextFormField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: data,
              hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
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
