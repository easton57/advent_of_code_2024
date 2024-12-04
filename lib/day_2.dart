import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() async {
  final inFile = File("inputs/day_2.txt");

  Stream<String> lines =
      inFile.openRead().transform(utf8.decoder).transform(LineSplitter());

  int safe = await isItSafe2(lines);

  print("Safe $safe");
}

Future<int> isItSafe(Stream<String> input) async {
  int safe = 0;

  // Time for a horrible loop
  await for (String i in input) {
    var split = i.split(" ");

    bool decreasing = false;

    for (int j = 1; j < split.length; j++) {
      int prev = int.parse(split[j - 1]);
      int curr = int.parse(split[j]);
      int diff = prev - curr;
      if (j - 1 == 0 && prev > curr) {
        decreasing = true;
      }

      if (!decreasing) {
        diff = diff * -1;
      }

      if (diff > 3 || diff < 1) {
        break;
      } else if (j + 1 == split.length) {
        safe++;
        decreasing = false;
      }
    }
  }

  return safe;
}

Future<int> isItSafe2(Stream<String> input) async {
  int safe = 0;

  // Time for a horrible loop
  await for (String i in input) {
    var split = i.split(" ");

    bool decreasing = false;
    bool bad_level_used = false;

    for (int j = 1; j < split.length; j++) {
      int prev = int.parse(split[j - 1]);
      int curr = int.parse(split[j]);
      int diff = prev - curr;
      if (j - 1 == 0 && prev > curr) {
        decreasing = true;
      }

      if (!decreasing) {
        diff = diff * -1;
      }

      if (diff > 3 || diff < 1) {
        break;
      } else if (j + 1 == split.length) {
        safe++;
        decreasing = false;
        bad_level_used = false;
      }
    }
  }

  return safe;
}
