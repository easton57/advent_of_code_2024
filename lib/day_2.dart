import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() async {
  final inFile = File("inputs/day_2.txt");
  int safe = 0;

  Stream<String> lines =
      inFile.openRead().transform(utf8.decoder).transform(LineSplitter());

  await for (String i in lines) {
    var split = i.split(" ");
    bool isSafe = await isItSafe(split, true);

    if (isSafe) {
      safe++;
    }
  }

  print("Safe $safe");
}

Future<bool> isItSafe(List split, bool allowRemoval) async {
  bool ascending = int.parse(split[0]) < int.parse(split[1]);
  bool isSafe = true;

  for (int i = 1; i < split.length; i++) {
    int prev = int.parse(split[i - 1]);
    int curr = int.parse(split[i]);
    if ((curr > prev) != ascending || (curr - prev).abs() > 3 || prev == curr) {
      isSafe = false;
    }
  }

  if (!isSafe && allowRemoval) {
    for (int i = 0; i < split.length; i++) {
      bool help = await isItSafe(split.sublist(0, i) + split.sublist(i + 1,), false);
      if (help) {
        isSafe = true;
      }
    }
  }

  return isSafe;
}
