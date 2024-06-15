import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var closingDayCheckboxes = <bool>[].obs;
  var smokingSeatCheckboxes = <bool>[].obs;
  var parkingCheckboxes = <bool>[].obs;
  var visitCheckboxes = <bool>[].obs;

  void initializeCheckboxes(
      {required int count,
      required bool isClosingDay,
      required bool isSmokingSeat,
      required bool isParking,
      required bool isVisit}) {
    if (isClosingDay) {
      closingDayCheckboxes.value = List<bool>.generate(count, (index) => false);
    } else if (isSmokingSeat) {
      smokingSeatCheckboxes.value =
          List<bool>.generate(count, (index) => false);
    } else if (isParking) {
      parkingCheckboxes.value = List<bool>.generate(count, (index) => false);
    } else if (isVisit) {
      visitCheckboxes.value = List<bool>.generate(count, (index) => false);
    }
  }

  void toggleClosingDayCheckbox(int index) {
    closingDayCheckboxes[index] = !closingDayCheckboxes[index];
  }

  void toggleSmokingSeatCheckbox(int index) {
    smokingSeatCheckboxes[index] = !smokingSeatCheckboxes[index];
  }

  void toggleParkingCheckbox(int index) {
    parkingCheckboxes[index] = !parkingCheckboxes[index];
  }

  void toggleVisitCheckbox(int index) {
    visitCheckboxes[index] = !visitCheckboxes[index];
  }
}
