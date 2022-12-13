import 'package:flutter/material.dart';
import 'package:flutter_architecture/business/bloc_factory.dart';
import 'package:flutter_architecture/ui/my_app.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();

  BlocFactory.instance.initialize();

  runApp(const MaterialApp(home: MyApp()));
}
