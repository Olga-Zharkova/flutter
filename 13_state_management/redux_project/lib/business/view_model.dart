import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:untitled1/features.dart';

import 'app_state.dart';
import 'counter_increment_action.dart';

class ViewModel {
  final List<Product> listProduct;
  final VoidCallback onIncrease;

  ViewModel({
    required this.listProduct,
    required this.onIncrease,
  });

  static ViewModel fromStore(Store<AppState> store) => ViewModel(
        listProduct: store.state.listProduct,
        onIncrease: () => store.dispatch(
          CounterIncrementAction(),
        ),
      );
}
