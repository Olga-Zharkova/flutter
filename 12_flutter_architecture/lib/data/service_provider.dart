import 'package:flutter_architecture/domain/user_service.dart';
import 'package:flutter_architecture/mock_server/dummy_service.dart';
import 'package:get_it/get_it.dart';

class ServiceProvider {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();
  static final instance = ServiceProvider();

  void initialize() {
    _getIt.registerLazySingleton<UserService>(() => DummyUserService());
  }
}
