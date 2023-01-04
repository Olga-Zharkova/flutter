import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';
import 'counter_increment_action.dart';

class ViewModel {
  final int value;
  final VoidCallback onIncrease;

  ViewModel({
    required this.value,
    required this.onIncrease,
  });

  static ViewModel fromStore(Store<AppState> store) => ViewModel(
        value: store.state.value,
        onIncrease: () => store.dispatch(
          CounterIncrementAction(),
        ),
      );
}
