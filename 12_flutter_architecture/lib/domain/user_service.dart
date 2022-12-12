import 'package:flutter_architecture/domain/user.dart';

abstract class UserService {
  Future<User> getDefaultUser();
  Future<User> getUserById(int id);
}
