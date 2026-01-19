import 'package:app_posto/shared/features/user/domain/repositories/user_repository_impl.dart';

class DeleteByCpf {
  final UserRepositoryImpl userRepositoryImpl;

  DeleteByCpf({required this.userRepositoryImpl});

  Future<void> deleteByCpf(String cpf) {
    return userRepositoryImpl.deleteByCpf(cpf);
  }
}
