import 'package:app_posto/shared/features/user/data/models/agent.dart';

abstract class AgentServiceDao {
  Future<Agent?> registerAgent({
    required String cpf,
    required String name,
    required String email,
    required String password,
  });

  Future<List<Agent?>> getAllAgents();
}
