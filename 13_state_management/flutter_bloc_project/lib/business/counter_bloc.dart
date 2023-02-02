import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/business/counter_event.dart';
import 'package:untitled1/features.dart';

class CounterBloc extends Bloc<CounterEvent, List<Product>> {
  final List<Product>? selectList;

  /// {@macro counter_bloc}
  CounterBloc({this.selectList}) : super(selectList ?? []) {
    on<CounterIncrementPressed>((event, emit) {
      emit([...state, event.product]);
    });

    on<CounterDecreasePressed>((event, emit) {
      if (state.length > 1) {
        state.remove(event.product);
      }

      emit(state);
    });
  }
}
