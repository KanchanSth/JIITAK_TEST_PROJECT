import 'package:flutter/material.dart';

appHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

appWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

const double vBox0 = 5.0;
const double vBox1 = 10.0;
const double vBox1andHalf = 15.0;
const double hBox1andHalf = 15.0;
const double vBox2 = 20.0;
const double vBox2andHalf = 30;
const double vBox3 = 40.0;
const double vBox4 = 80.0;
const double hBox0 = 5.0;
const double hBox0andHalf = 6.0;
const double hBox1 = 10.0;
const double hBox2 = 20.0;
const double hBox3 = 40.0;
const double hBox4 = 80.0;

const SizedBox vSizedBox0 = SizedBox(height: vBox0);
const SizedBox vSizedBox1 = SizedBox(height: vBox1);
const SizedBox vSizedBox1andHalf = SizedBox(height: vBox1andHalf);
const SizedBox vSizedBox2 = SizedBox(height: vBox2);
const SizedBox vSizedBox2andHalf = SizedBox(height: vBox2andHalf);
const SizedBox vSizedBox3 = SizedBox(height: vBox3);
const SizedBox vSizedBox4 = SizedBox(height: vBox4);
const SizedBox hSizedBox0 = SizedBox(width: hBox0);
const SizedBox hSizedBox0andHalf = SizedBox(width: hBox0andHalf);
const SizedBox hSizedBox1 = SizedBox(width: hBox1);
const SizedBox hSizedBox1andHalf = SizedBox(width: hBox1andHalf);
const SizedBox hSizedBox2 = SizedBox(width: hBox2);
const SizedBox hSizedBox3 = SizedBox(width: hBox3);
const SizedBox hSizedBox4 = SizedBox(width: hBox4);
