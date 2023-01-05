import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/business/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  /// {@macro counter_bloc}
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
  }
}

