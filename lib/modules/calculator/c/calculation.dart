import 'dart:collection';

class Calculation {
  double calculate(String input) {
    // Remove spaces from the input
    input = input.replaceAll(" ", "");

    // Updated regex to handle negative numbers
    final RegExp regex = RegExp(r'(-?\d+\.?\d*)([\+\-\*/])(-?\d+\.?\d*)');
    final match = regex.firstMatch(input);

    if (match == null) {
      throw FormatException("Invalid input format: $input");
    }

    // Parse operands and operator
    final double operand1 = double.parse(match.group(1)!);
    final String operator = match.group(2)!;
    final double operand2 = double.parse(match.group(3)!);

    // Perform the calculation
    switch (operator) {
      case '+':
        return operand1 + operand2;
      case '-':
        return operand1 - operand2;
      case '*':
        return operand1 * operand2;
      case '/':
        if (operand2 == 0) {
          throw ArgumentError("Division by zero is not allowed.");
        }
        return operand1 / operand2;
      default:
        throw UnsupportedError("Operator not supported: $operator");
    }
  }
}

class AdvanceCalculation {
  double calculate(String input) {
    // Step 1: Tokenize the input
    final List<String> tokens = tokenize(input);

    // Step 2: Convert to Reverse Polish Notation (RPN)
    final List<String> rpn = toRPN(tokens);

    // Step 3: Evaluate the RPN
    return evaluateRPN(rpn);
  }

  List<String> tokenize(String input) {
    final RegExp regex = RegExp(r'(\d+\.?\d*|[\+\-\*/\(\)])');
    return regex.allMatches(input).map((m) => m.group(0)!).toList();
  }

  List<String> toRPN(List<String> tokens) {
    final List<String> output = [];
    final Queue<String> operators = Queue<String>();
    final Map<String, int> precedence = {
      '+': 1,
      '-': 1,
      '*': 2,
      '/': 2,
    };

    for (final token in tokens) {
      if (RegExp(r'\d+\.?\d*').hasMatch(token)) {
        // If token is a number, add to output
        output.add(token);
      } else if ('+-*/'.contains(token)) {
        // If token is an operator
        while (operators.isNotEmpty &&
            precedence[operators.last]! >= precedence[token]!) {
          output.add(operators.removeLast());
        }
        operators.addLast(token);
      } else if (token == '(') {
        // If token is a left parenthesis
        operators.addLast(token);
      } else if (token == ')') {
        // If token is a right parenthesis
        while (operators.isNotEmpty && operators.last != '(') {
          output.add(operators.removeLast());
        }
        if (operators.isEmpty || operators.last != '(') {
          throw FormatException("Mismatched parentheses");
        }
        operators.removeLast(); // Remove '('
      }
    }

    // Pop any remaining operators
    while (operators.isNotEmpty) {
      final op = operators.removeLast();
      if (op == '(' || op == ')') {
        throw FormatException("Mismatched parentheses");
      }
      output.add(op);
    }

    return output;
  }

  double evaluateRPN(List<String> rpn) {
    final Stack<double> stack = Stack<double>();

    for (final token in rpn) {
      if (RegExp(r'\d+\.?\d*').hasMatch(token)) {
        // If token is a number, push to stack
        stack.push(double.parse(token));
      } else if ('+-*/'.contains(token)) {
        // If token is an operator, pop two operands
        final b = stack.pop();
        final a = stack.pop();
        switch (token) {
          case '+':
            stack.push(a + b);
            break;
          case '-':
            stack.push(a - b);
            break;
          case '*':
            stack.push(a * b);
            break;
          case '/':
            if (b == 0) {
              throw ArgumentError("Division by zero is not allowed.");
            }
            stack.push(a / b);
            break;
        }
      }
    }

    if (stack.length != 1) {
      throw FormatException("Invalid expression");
    }

    return stack.pop();
  }
}

// A simple stack implementation
class Stack<E> {
  final _list = <E>[];

  void push(E value) => _list.add(value);
  E pop() => _list.removeLast();
  E get peek => _list.last;
  bool get isEmpty => _list.isEmpty;
  int get length => _list.length;
}

// void main() {
//   final calc = Calculation();

//   print(calc.calculate("4*5+10-10/2")); // Output: 25.0
//   print(calc.calculate("(4+6)*3"));     // Output: 30.0
//   print(calc.calculate("10/2+3*4"));   // Output: 17.0
// }
