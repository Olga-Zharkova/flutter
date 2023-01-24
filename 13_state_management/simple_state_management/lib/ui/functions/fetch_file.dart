import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

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
