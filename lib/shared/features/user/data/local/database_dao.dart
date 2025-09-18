import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class DatabaseDao {
  @Query('Select * from user WHERE agentCpf = :agentCpf')
  Future<List<UserEntity>> getByAgentCpf(String agentCpf);

  @Query('DELETE FROM user WHERE cpf = :cpf')
  Future<void> deleteByCpf(String cpf);
}
