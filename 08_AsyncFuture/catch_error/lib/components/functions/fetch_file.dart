import 'package:flutter/services.dart';
import 'dart:io' as io;

Future<String> fetchFileFromAssets(String assetsPath) async {
 try {
    await rootBundle.load(assetsPath);
    return rootBundle.loadString(assetsPath).then((file) => file);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    throw ArgumentError();
  }
}
