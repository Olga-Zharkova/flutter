import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business/counter.dart';
import 'home_screen.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<Counter>(
        create: (_) => Counter(),
        child: const HomeScreen(),
      ),
    );
  }
}
