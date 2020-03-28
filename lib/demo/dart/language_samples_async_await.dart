import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'language_samples_spacecraft.dart';

class AsyncAwait {
  final Duration fiveSeconds = Duration(seconds: 5);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(fiveSeconds);
    print('async and await: $message, after ${fiveSeconds.inSeconds} seconds');
  }

  Future<void> printWithDelay2(String message) =>
      Future.delayed(fiveSeconds).then((_) {
        print('then: $message, after ${fiveSeconds.inSeconds} seconds');
      });

  Future<void> createDescriptions(Iterable<String> objects) async {
    final String _path = await _localPath;
    for (String object in objects) {
      try {
        File file = File('$_path/$object.txt');
        if (await file.exists()) {
          DateTime modified = await file.lastModified();
          print('File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start describing $object in this file.');

        String writeContent = await file.readAsString();
        print('File for $object already create. It was written content: $writeContent');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
    for (var object in objects) {
      await Future.delayed(fiveSeconds);
      yield '${craft.name} flies by $object';
    }
  }

  Future<String> get _localPath async {
    Directory directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
}
