import 'package:flutter_architecture/business/main_bloc.dart';
import 'package:flutter_architecture/data/service_provider.dart';
import 'package:flutter_architecture/domain/user_service.dart';
import 'package:get_it/get_it.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt();
  static final instance = BlocFactory();

  void initialize() {
    ServiceProvider.instance.initialize();
    _getIt.registerFactory<MainBloc>(
          () => MainBloc(
        userService: ServiceProvider.instance.get<UserService>(),
      ),
    );
  }
}