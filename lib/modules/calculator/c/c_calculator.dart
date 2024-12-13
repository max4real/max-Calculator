import 'package:get/get.dart';
import 'package:max_calculator/modules/calculator/c/calculation.dart';
import 'package:intl/intl.dart';

class CalculatorController extends GetxController {
  final Calculation calculation = Calculation();
  final RxBool isDarkTheme = true.obs;
  final RxString strDisplay = "".obs;
  final RxString strHistory = "".obs;

  final RxBool xDivision = false.obs;
  final RxBool xMultiplication = false.obs;
  final RxBool xSubtraction = false.obs;
  final RxBool xAddition = false.obs;

  String num = "0";

  // Appends numbers or signs to the display
  void onTapNumber(String key) => strDisplay.value += key;

  void onTapSign(String key) {
    if (key == "%") {
      print("dont know the logic");
      
    } else if (key == "+/-") {
      if (strDisplay.value.isNotEmpty) {
        if (strDisplay.value.startsWith("-")) {
          strDisplay.value = strDisplay.value.substring(1);
        } else {
          strDisplay.value = "-${strDisplay.value}";
        }
      }
    } else if (key == ".") {
      if (strDisplay.value.contains(".")) {
      } else {
        strDisplay.value += ".";
      }
    }
  }

  // Handles operator input
  void onTapOperator(String key) {
    void setOperatorState(
        bool division, bool multiplication, bool subtraction, bool addition) {
      xDivision.value = division;
      xMultiplication.value = multiplication;
      xSubtraction.value = subtraction;
      xAddition.value = addition;
    }

    if (_isActiveOperator(key)) {
      resetOperator();
      strDisplay.value = num;
    } else {
      num = strDisplay.value;
      strDisplay.value = "";
      setOperatorState(key == "/", key == "*", key == "-", key == "+");
    }
  }

  // Checks if the operator is currently active
  bool _isActiveOperator(String key) {
    switch (key) {
      case "/":
        return xDivision.value;
      case "*":
        return xMultiplication.value;
      case "-":
        return xSubtraction.value;
      case "+":
        return xAddition.value;
      default:
        return false;
    }
  }

  // Removes the last character from the display
  void onTapBackSpace() {
    if (strDisplay.value.isNotEmpty) {
      strDisplay.value =
          strDisplay.value.substring(0, strDisplay.value.length - 1);
    }
  }

  // Resets all operators
  void resetOperator() {
    xDivision.value = false;
    xMultiplication.value = false;
    xSubtraction.value = false;
    xAddition.value = false;
  }

  // Clears all data
  void onTapAC() {
    strDisplay.value = "";
    strHistory.value = "";
    num = "";
    resetOperator();
  }

  // Calculates the result
  void onTapEqual() {
    final operator = _getActiveOperator();
    if (operator.isEmpty) return;

    final expression =
        "${num == "" ? "0" : num} $operator ${strDisplay.value == "" ? "0" : strDisplay.value}";

    final result = calculation.calculate(expression);

    strDisplay.value = result == result.roundToDouble()
        ? result.toInt().toString()
        : result.toString();
    strHistory.value = expression.replaceAll("*", "x");

    resetOperator();
  }

  // Retrieves the active operator as a string
  String _getActiveOperator() {
    if (xDivision.value) return "/";
    if (xMultiplication.value) return "*";
    if (xSubtraction.value) return "-";
    if (xAddition.value) return "+";
    return "";
  }

  // Formats numbers with commas
  String formatNumber(String data) {
    final formatter = NumberFormat('#,##0');
    try {
      final number = double.tryParse(data);
      if (number == null) throw const FormatException("Invalid number");

      final parts = data.split('.');
      final formattedIntegerPart = formatter.format(int.parse(parts[0]));

      if (parts.length > 1) {
        return '$formattedIntegerPart.${parts.sublist(1).join(".")}';
      }

      return formattedIntegerPart;
    } catch (e) {
      print("Invalid input for formatting: $data");
      return data;
    }
  }
}
