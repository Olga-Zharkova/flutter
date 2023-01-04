import 'package:flutter/material.dart';
import 'package:mob_x/ui/home_screen.dart';
import 'package:provider/provider.dart';

import '../business/counter.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Counter(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
