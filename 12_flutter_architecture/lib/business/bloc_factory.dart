import 'package:get_it/get_it.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt();
  static final instance = BlocFactory();
}
