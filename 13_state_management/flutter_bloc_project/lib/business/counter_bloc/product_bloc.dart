import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/business/counter_bloc/product_event.dart';
import 'package:untitled1/features.dart';

class ProductBloc extends Bloc<CounterEvent, int> {
  final int? value;

  /// {@macro counter_bloc}
  ProductBloc({this.value}) : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecreasePressed>((event, emit) {
      if (state > 1) {
        state - 1;
      }
      emit(state);
    });
  }
}
