import 'package:get/get.dart';
import 'package:max_calculator/modules/calculator/c/calculation.dart';
import 'package:intl/intl.dart';

class CalculatorController extends GetxController {
  Calculation calculation = Calculation();
  RxBool isDarkTheme = true.obs;
  RxString strDisplay = "".obs;

  void onTapNumber(String key) {
    print("Number - " + key);
    strDisplay.value = strDisplay.value + key;
  }

  void onTapSign(String key) {
    print("Sign - " + key);
    strDisplay.value = strDisplay.value + key;
  }

  void onTapBackSpace() {
    print("back space");
    if (strDisplay.value.isNotEmpty) {
      strDisplay.value =
          strDisplay.value.substring(0, strDisplay.value.length - 1);
    }
  }

  void onTapAC() {
    print("AC");
    strDisplay.value = "";
  }

  void onTapEqual() {
    double result = calculation.calculate(strDisplay.value);

    if (result == result.roundToDouble()) {
      strDisplay.value = result.toInt().toString();
    } else {
      strDisplay.value = result.toString();
    }
  }

  String formatNumber(String data) {
    var formatter = NumberFormat('#,##0');
    try {
      var number = double.parse(data);
      return formatter.format(number);
    } catch (e) {
      print("Invalid input for formatting: $data");
      return data;
    }
  }
}
