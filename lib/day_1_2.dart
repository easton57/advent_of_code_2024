import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() async {
  final inFile = File("inputs/day_1.txt");
  var left = {};
  List<int> right = [];
  int similarity = 0;

  Stream<String> lines =
      inFile.openRead().transform(utf8.decoder).transform(LineSplitter());

  // Split the lines into our two lists
  await for (var value in lines) {
    var split = value.split("   ");
    left[(int.parse(split[0]))] = 0;
    right.add(int.parse(split[1]));
  }

  // Determine the frequency
  for (int i = 0; i < right.length; i++) {
    if (left.containsKey(right[i])) {
      left[right[i]] += 1;
    }
  }

  // Find the frequency
  for (int item in left.keys) {
    int newInt = left[item];
    similarity += item * newInt;
  }

  // print it
  print("The similarity score is: $similarity");
}
