import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() async {
  // Read our file
  final inFile = File("inputs/day_3.txt");
  String fileData = await inFile.readAsString();
  double result = 0;

  // Regex Expression
  final matchString = RegExp(r'mul\(\d+\,\d+\)');

  // Extract matches
  List matches = matchString.allMatches(fileData).toList();

  // loop and multiply
  for (RegExpMatch i in matches) {
    // Separate string into ints
    List numbers = fileData.substring(i.start, i.end).split("(")[1].split(",");
    String secondTemp = numbers[1];

    // Remove the )
    secondTemp = secondTemp.substring(0, secondTemp.length - 1);

    double firstNumber = double.parse(numbers[0]);
    double secondNumber = double.parse(secondTemp);

    // Multiply numbers
    double product = firstNumber * secondNumber;

    // Add them to result
    result += product;
  }

  print("The result is: $result");
}
