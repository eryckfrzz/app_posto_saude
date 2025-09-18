import 'package:floor/floor.dart';

@Entity(tableName: 'agent')
class Agent {
  @primaryKey
  String cpf;
  String name;
  String email;
  String password;

  Agent({
    required this.cpf,
    required this.name,
    required this.email,
    required this.password,
  });
}
