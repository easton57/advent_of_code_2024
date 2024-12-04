import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() async {
  final inFile = File("inputs/day_1.txt");
  List<int> left = [];
  List<int> right = [];
  int sum = 0;

  Stream<String> lines =
      inFile.openRead().transform(utf8.decoder).transform(LineSplitter());

  // Split the lines into our two lists
  await for (var value in lines) {
    var split = value.split("   ");
    left.add(int.parse(split[0]));
    right.add(int.parse(split[1]));
  }

  // Sort our lists
  left.sort();
  right.sort();

  // iterate again and add the differences to the sum
  for (int i = 0; i < left.length; i++) {
    int solution = right[i] - left[i];

    if (solution < 0) {
      solution = solution * -1;
    }

    sum = sum + (solution);
  }

  // print it
  print("The sum is: $sum");
}
