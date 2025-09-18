import 'package:app_posto/shared/features/user/domain/entities/record_entity.dart';
import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class DatabaseDao {
  @Query('SELECT * FROM user WHERE agentCpf = :agentCpf')
  Future<List<UserEntity>> getByAgentCpf(String agentCpf);

  @Query('SELECT * FROM record WHERE Usercpf = :cpf')
  Future<List<RecordEntity>> getRecordsByUserCpf(String cpf);

  @Query('DELETE FROM user WHERE cpf = :cpf')
  Future<void> deleteByCpf(String cpf);
}
