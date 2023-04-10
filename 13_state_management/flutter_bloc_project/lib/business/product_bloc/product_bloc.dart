import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled1/features.dart';

class ProductBloc extends Bloc<ProductEvent, int> {
  final int? value;

  /// {@macro counter_bloc}
  ProductBloc({this.value}) : super(0) {
    on<ProductIncrementPressed>((event, emit) {
      emit(state + 1);
    });

    on<ProductDecreasePressed>((event, emit) {
      if (state > 1) {
        state - 1;
      }
      emit(state);
    });
  }
}
