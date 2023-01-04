import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_project/business/app_state.dart';

import 'counter_connector.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: CounterConnector(),
      ),
    );
  }
}
