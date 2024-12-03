import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  final inFile = File("inputs/day_2.txt");

  Stream<String> lines =
      inFile.openRead().transform(utf8.decoder).transform(LineSplitter());

  print(isItSafe(lines));
}

Future<int> isItSafe(Stream<String> input) async {
  int safe = 0;

  // Time for a horrible loop
  await for (String i in input) {
    var split = i.split(" ");

    for (int j = 1; j < split.length; j++) {
      int diff = (int.parse(split[j - 1]) - int.parse(split[j])) * -1;

      if (diff > 3) {
        break;
      }
      else {
        if (j++ == split.length) {
          // Check to make sure it's increasing or decreasing

           safe++;
        }
      }
    }
  }

  return safe;
}
