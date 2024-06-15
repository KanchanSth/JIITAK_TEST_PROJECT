import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/controllers/check_box_controller.dart';

class CheckboxGrid extends StatelessWidget {
  final List<String> labels;
  final int crossAxisCount;
  final bool isClosingDay;
  final bool isSmokingSeat;
  final bool isParking;
  final bool isVisit;

  const CheckboxGrid({
    super.key,
    required this.labels,
    required this.crossAxisCount,
    this.isClosingDay = false,
    this.isSmokingSeat = false,
    this.isParking = false,
    this.isVisit = false,
  });

  @override
  Widget build(BuildContext context) {
    final CheckboxController checkboxController = Get.put(CheckboxController());

    checkboxController.initializeCheckboxes(
        count: labels.length,
        isClosingDay: isClosingDay,
        isSmokingSeat: isSmokingSeat,
        isParking: isParking,
        isVisit: isVisit);

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 3,
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 0.5),
      itemCount: labels.length,
      itemBuilder: (context, index) {
        return Obx(() {
          bool checkboxValue = false;
          Function(bool?)? onChanged;

          if (isClosingDay) {
            checkboxValue = checkboxController.closingDayCheckboxes[index];
            onChanged = (bool? value) {
              checkboxController.toggleClosingDayCheckbox(index);
            };
          } else if (isSmokingSeat) {
            checkboxValue = checkboxController.smokingSeatCheckboxes[index];
            onChanged = (bool? value) {
              checkboxController.toggleSmokingSeatCheckbox(index);
            };
          } else if (isParking) {
            checkboxValue = checkboxController.parkingCheckboxes[index];
            onChanged = (bool? value) {
              checkboxController.toggleParkingCheckbox(index);
            };
          } else if (isVisit) {
            checkboxValue = checkboxController.visitCheckboxes[index];
            onChanged = (bool? value) {
              checkboxController.toggleVisitCheckbox(index);
            };
          }

          return Row(
            children: [
              Checkbox(
                side: BorderSide(color: Color(0xFFE8E8E8), width: 1.5.w),
                activeColor: const Color(0xFFEE7D42),
                value: checkboxValue,
                onChanged: onChanged,
              ),
              Expanded(
                child: Text(
                  labels[index],
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
