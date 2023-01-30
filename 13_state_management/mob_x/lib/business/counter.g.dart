// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Counter on _Counter, Store {
  late final _$listProductAtom =
      Atom(name: '_Counter.listProduct', context: context);

  @override
  List<Product> get listProduct {
    _$listProductAtom.reportRead();
    return super.listProduct;
  }

  @override
  set listProduct(List<Product> value) {
    _$listProductAtom.reportWrite(value, super.listProduct, () {
      super.listProduct = value;
    });
  }

  late final _$isLoadedAtom = Atom(name: '_Counter.isLoaded', context: context);

  @override
  bool get isLoaded {
    _$isLoadedAtom.reportRead();
    return super.isLoaded;
  }

  @override
  set isLoaded(bool value) {
    _$isLoadedAtom.reportWrite(value, super.isLoaded, () {
      super.isLoaded = value;
    });
  }

  late final _$_CounterActionController =
      ActionController(name: '_Counter', context: context);

  @override
  void increment(Product product) {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.increment');
    try {
      return super.increment(product);
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrease(Product product) {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.decrease');
    try {
      return super.decrease(product);
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadingState() {
    final _$actionInfo = _$_CounterActionController.startAction(
        name: '_Counter.changeLoadingState');
    try {
      return super.changeLoadingState();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listProduct: ${listProduct},
isLoaded: ${isLoaded}
    ''';
  }
}
