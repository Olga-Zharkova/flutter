import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/ui/home_screen.dart';

import '../business/counter.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: const MaterialApp(home: HomeScreen()),
    );
  }
}
