import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

appHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

appWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double vBox0 = 5.0;
double vBox1 = 10.0;
double vBox1andHalf = 15.0;
double hBox1andHalf = 15.0;
double vBox2 = 20.0;
double vBox2andHalf = 30;
double vBox3 = 40.0;
double vBox4 = 80.0;
double hBox0 = 5.0;
double hBox0andHalf = 6.0;
double hBox1 = 10.0;
double hBox2 = 20.0;
double hBox3 = 40.0;
double hBox4 = 80.0;

SizedBox vSizedBox0 = SizedBox(height: vBox0.h);
SizedBox vSizedBox1 = SizedBox(height: vBox1.h);
SizedBox vSizedBox1andHalf = SizedBox(height: vBox1andHalf.h);
SizedBox vSizedBox2 = SizedBox(height: vBox2.h);
SizedBox vSizedBox2andHalf = SizedBox(height: vBox2andHalf.h);
SizedBox vSizedBox3 = SizedBox(height: vBox3.h);
SizedBox vSizedBox4 = SizedBox(height: vBox4.h);
SizedBox hSizedBox0 = SizedBox(width: hBox0.h);
SizedBox hSizedBox0andHalf = SizedBox(width: hBox0andHalf.w);
SizedBox hSizedBox1 = SizedBox(width: hBox1.w);
SizedBox hSizedBox1andHalf = SizedBox(width: hBox1andHalf.w);
SizedBox hSizedBox2 = SizedBox(width: hBox2.w);
SizedBox hSizedBox3 = SizedBox(width: hBox3.w);
SizedBox hSizedBox4 = SizedBox(width: hBox4.w);
