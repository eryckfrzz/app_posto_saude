import 'package:app_posto/shared/features/user/data/models/user.dart';

abstract class UserServiceDao {
  Future<User?> registerUser({
    required String cpf,
    required String name,
    required String phone,
  });

  Future<User?> registerRecord({
    required String name,
    required String birthday,
    required String gender,
    required String moreInfo,
  });

  Future<List<User?>> getAllUsers();
}
