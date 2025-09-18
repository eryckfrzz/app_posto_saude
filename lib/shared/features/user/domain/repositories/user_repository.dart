import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsersByAgent(String agentCpf);
}
