import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';
import 'package:app_posto/shared/features/user/domain/repositories/user_repository.dart';

class GetUserByAgent {
  final UserRepository userRepository;

  GetUserByAgent({required this.userRepository});

  Future<List<UserEntity>> getUsersByAgent(String agentCpf) {
    return userRepository.getUsersByAgent(agentCpf);
  }
}
