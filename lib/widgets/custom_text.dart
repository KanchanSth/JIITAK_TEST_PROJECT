import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 5.h),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
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
        ],
      ),
    );
  }
}
