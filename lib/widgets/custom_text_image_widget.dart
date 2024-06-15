import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/core/app/dimensions.dart';
import 'package:test_project/widgets/custom_text.dart';

class CustomTextImageWidget extends StatelessWidget {
  const CustomTextImageWidget(
      {super.key,
      required this.pText,
      required this.text,
      required this.image1,
      required this.image2,
      required this.image3,
      this.imageOnly = false});

  final String pText;
  final String text;
  final String image1;
  final String image2;
  final String image3;
  final bool imageOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imageOnly
            ? const SizedBox.shrink()
            : CustomRequiredText(pText: pText, text: text),
        Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 15.h),
          child: Row(
            children: [
              Expanded(child: Image.asset(image1)),
              Expanded(child: Image.asset(image2)),
              Expanded(
                child: Image.asset(
                  image3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomRequiredText extends StatelessWidget {
  final String pText;
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;

  const CustomRequiredText(
      {super.key,
      required this.pText,
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
                  text: pText,
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
          hSizedBox1,
          CustomText(
            text: '($text)',
            size: 14.sp,
            color: const Color.fromARGB(255, 156, 152, 150),
          )
        ],
      ),
    );
  }
}
