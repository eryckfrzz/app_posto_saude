import 'package:app_posto/shared/features/user/domain/entities/record_entity.dart';
import 'package:app_posto/shared/features/user/domain/repositories/user_repository.dart';

class GetRecordsByUser {
  final UserRepository userRepository;

  GetRecordsByUser({required this.userRepository});

  Future<List<RecordEntity>> getRecordsByUserCpf(String cpf) {
    return userRepository.getRecordsByUserCpf(cpf);
  }
}
