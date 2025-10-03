import 'package:app_posto/shared/features/user/domain/entities/agent_entity.dart';
import 'package:app_posto/shared/features/user/domain/entities/record_entity.dart';
import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsersByAgent(String agentCpf);
  Future<List<RecordEntity>> getRecordsByUserCpf(String cpf);
}
