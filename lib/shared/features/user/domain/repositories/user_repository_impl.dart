import 'package:app_posto/shared/features/user/data/local/database_dao.dart';
import 'package:app_posto/shared/features/user/domain/entities/agent_entity.dart';
import 'package:app_posto/shared/features/user/domain/entities/record_entity.dart';
import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';
import 'package:app_posto/shared/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final DatabaseDao databaseDao;
  UserRepositoryImpl({required this.databaseDao});

  @override
  Future<List<UserEntity>> getUsersByAgent(String agentCpf) {
    return databaseDao.getByAgentCpf(agentCpf);
  }

  @override
  Future<List<RecordEntity>> getRecordsByUserCpf(String cpf) {
    return databaseDao.getRecordsByUserCpf(cpf);
  }

  @override
  Future<AgentEntity> registerAgent(AgentEntity agent) {
    // TODO: implement registerAgent
    throw UnimplementedError();
  }
}
