import 'package:flutter/material.dart';
import 'package:flutter_architecture/business/main_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return Provider<MainBloc>(
      create: (_) => _mainBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('main page')),
        body: StreamBuilder<MainBlocState>(
          stream: context.read<MainBloc>().state,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final state = snapshot.data;

              return state!.map<Widget>(
                loading: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Main Page'),
                  ),
                  body: const Center(child: Text('Initinalizing')),
                ),
                loaded: (state) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Main Page'),
                  ),
                  body: Center(
                    child: Text(state.user.name),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => context.read<MainBloc>().add(
                          MainBlocEvent.setUser(userId: state.user.id + 1),
                        ),
                    child: const Icon(Icons.add),
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
