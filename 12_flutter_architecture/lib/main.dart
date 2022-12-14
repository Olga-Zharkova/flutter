import 'package:flutter/material.dart';
import 'package:flutter_architecture/business/main_bloc.dart';
import 'package:flutter_architecture/data/service_provider.dart';
import 'package:flutter_architecture/domain/user_service.dart';
import 'package:flutter_architecture/ui/entry_point.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceProvider.instance.initialize();
  GetIt.I.registerFactory<MainBloc>(
    () => MainBloc(
      userService: ServiceProvider.instance.get<UserService>(),
    ),
  );
  runApp(const EntryPoint());
}
