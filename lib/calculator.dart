import 'dart:io';

void main() {
  print("Flutter Calculator assignment");

  while (true) {
    print("\nEnter your calculation to or type 'exit' if you want to quit");
    String input = stdin.readLineSync()!.trim().toLowerCase();

    if (input == 'exit') {
      print("Exiting the calculator. Goodbye!");
      break;
    }

    List<String> tokens = input.split(' ');

    try {
      if (tokens.length < 3) {
        print("Invalid input. Please provide at least two numbers and an operator.");
        continue;
      }

      double result = double.parse(tokens[0]);

      for (int i = 1; i < tokens.length; i += 2) {
        String operator = tokens[i];
        double operand = double.parse(tokens[i + 1]);

        switch (operator) {
          case '+':
            result += operand;
            break;
          case '-':
            result -= operand;
            break;
          case '*':
            result *= operand;
            break;
          case '/':
            if (operand == 0) {
              print("Error: Division by zero is not allowed.");
              continue;
            }
            result /= operand;
            break;
          default:
            print("Invalid operator: $operator");
            continue;
        }
      }

      print("Result: $result");
    } catch (e) {
      print("Error: Invalid input. Please enter valid numbers and operators.");
    }
  }
}
