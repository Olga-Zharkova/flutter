import 'package:flutter_architecture/domain/user.dart';
import 'package:flutter_architecture/domain/user_service.dart';
import 'package:injectable/injectable.dart';



@LazySingleton(as: DummyUserService)
class DummyUserService implements UserService {
  @override
  Future<User> getDefaultUser() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return const User(id: 1, name: 'Olga', surname: 'Zharkova', year: 21);
  }

  @override
  Future<User> getUserById(int id) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return User(id: id, name: 'Olga', surname: 'Zharkova', year: 21);
  }
}
