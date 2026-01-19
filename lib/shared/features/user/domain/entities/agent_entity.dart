import 'package:floor/floor.dart';

@Entity(tableName: 'agent')
class AgentEntity {
  @primaryKey
  String cpf;
  String name;
  Stream phone;
  String email;
  String password;

  AgentEntity({
    required this.cpf,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
}
