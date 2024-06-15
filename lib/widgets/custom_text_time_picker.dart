import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_project/controllers/time_picker_controller.dart';
import 'package:test_project/core/app/dimensions.dart';
import 'package:test_project/widgets/custom_text.dart';

class CustomTextTimePicker extends StatelessWidget {
  CustomTextTimePicker({super.key, required this.text});
  final TimePickerController timePickerController =
      Get.put(TimePickerController());

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RequiredText(
          text: text,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: <Widget>[
              Obx(() {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                      color: const Color.fromARGB(255, 231, 231, 231),
                    ),
                  ),
                  child: DropdownButton<TimeOfDay>(
                    value: timePickerController.selectedTime1.value,
                    items: List.generate(
                      24,
                      (hour) => List.generate(
                        60,
                        (minute) => TimeOfDay(hour: hour, minute: minute),
                      ),
                    )
                        .expand((element) => element)
                        .map<DropdownMenuItem<TimeOfDay>>((TimeOfDay time) {
                      return DropdownMenuItem<TimeOfDay>(
                        value: time,
                        child: Text(
                          "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      );
                    }).toList(),
                    onChanged: (TimeOfDay? newValue) {
                      timePickerController.selectedTime1.value = newValue!;
                    },
                    underline: const SizedBox(),
                    icon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset('assets/icons/dropdown.svg'),
                    ),
                  ),
                );
              }),
              hSizedBox1,
              SvgPicture.asset('assets/icons/til.svg'),
              hSizedBox1,
              Obx(() {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0.r),
                    border: Border.all(
                      color: const Color.fromARGB(255, 231, 231, 231),
                    ),
                  ),
                  child: DropdownButton<TimeOfDay>(
                    value: timePickerController.selectedTime2.value,
                    items: List.generate(
                      24,
                      (hour) => List.generate(
                        60,
                        (minute) => TimeOfDay(hour: hour, minute: minute),
                      ),
                    )
                        .expand((element) => element)
                        .map<DropdownMenuItem<TimeOfDay>>((TimeOfDay time) {
                      return DropdownMenuItem<TimeOfDay>(
                        value: time,
                        child: Text(
                          "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      );
                    }).toList(),
                    onChanged: (TimeOfDay? newValue) {
                      timePickerController.selectedTime2.value = newValue!;
                    },
                    underline: const SizedBox(),
                    icon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset('assets/icons/dropdown.svg'),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
