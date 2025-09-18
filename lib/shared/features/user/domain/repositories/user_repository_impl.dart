import 'package:app_posto/shared/features/user/data/local/database_dao.dart';
import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';
import 'package:app_posto/shared/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final DatabaseDao databaseDao;
  UserRepositoryImpl({required this.databaseDao});

  @override
  Future<List<UserEntity>> getUsersByAgent(String agentCpf) {
    return databaseDao.getByAgentCpf(agentCpf);
  }
}
