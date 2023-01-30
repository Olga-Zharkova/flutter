import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux_project/business/app_state.dart';
import 'package:redux_project/ui/home_screen.dart';

import '../business/view_model.dart';

class CounterConnector extends StatelessWidget {
  const CounterConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        converter: ViewModel.fromStore,
        builder: (context, vm) {
          return HomeScreen(
            value: vm.listProduct.length,
            increase: vm.onIncrease,
          );
        });
  }
}
