import 'package:flutter/material.dart';
import 'package:flutter_architecture/business/main_bloc.dart';
import 'package:flutter_architecture/ui/my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late final MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = GetIt.I.get<MainBloc>();
    _mainBloc.add(const MainBlocEvent.init());
  }

  @override
  void dispose() {
    _mainBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<MainBloc>(
        create: (_) => _mainBloc,
        child: const MyApp(),
      ),
    );
  }
}
