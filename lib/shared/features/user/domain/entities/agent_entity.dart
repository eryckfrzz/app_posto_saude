import 'package:floor/floor.dart';

@Entity(tableName: 'agent')
class AgentEntity {
  @primaryKey
  String cpf;
  String name;
  String email;
  String password;

  AgentEntity({
    required this.cpf,
    required this.name,
    required this.email,
    required this.password,
  });
}
