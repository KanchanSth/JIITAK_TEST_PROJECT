import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePickerController extends GetxController {
  var selectedTime1 = TimeOfDay.now().obs;
  var selectedTime2 = TimeOfDay.now().obs;
}
