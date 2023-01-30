import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:untitled1/features.dart';

import 'counter_increment_action.dart';

@immutable
class AppState {
  final List<Product> listProduct;
  final bool isLoaded;

  const AppState({
    this.listProduct = [],
    this.isLoaded = false,
  });

  factory AppState.initial() => const AppState();

  AppState copyWith({
    List<Product>? listProduct,
    bool? isLoaded,
  }) {
    return AppState(
      listProduct: listProduct ?? this.listProduct,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          listProduct == other.listProduct;

  @override
  int get hashCode => listProduct.length.hashCode;

  @override
  String toString() {
    return 'AppState{value: ${listProduct.length}}';
  }
}

final incrementReducer = combineReducers<List<Product>>([
  TypedReducer<List<Product>, CounterIncrementAction>(_increment),
]);

List<Product> _increment(List<Product> listProduct, CounterIncrementAction action) {
  return listProduct;
}

AppState appReducer(AppState state, action) {
  return AppState(
    listProduct: incrementReducer(state.listProduct, action),
  );
}
