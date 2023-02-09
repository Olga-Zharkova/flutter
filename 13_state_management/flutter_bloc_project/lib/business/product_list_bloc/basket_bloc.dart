import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/business/product_list_bloc/basket_event.dart';
import 'package:untitled1/features.dart';

class BasketBloc extends Bloc<ProductListEvent, List<Product>> {
  final List<Product>? selectList;

  /// {@macro counter_bloc}
  BasketBloc({this.selectList}) : super(selectList ?? []) {
    on<BasketIncrementPressed>((event, emit) {
      emit([...state, event.product]);
    });

    on<BasketDecreasePressed>((event, emit) {
      if (state.length > 1) {
        state.remove(event.product);
      }

      emit(state);
    });
  }
}
