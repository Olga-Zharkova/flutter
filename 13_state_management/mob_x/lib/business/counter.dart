import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 0;

  @observable
  bool isLoaded = false;

  @action
  void increment() {
    value++;
  }

  @action
  void changeLoadingState() {
    isLoaded = !isLoaded;
  }
}
