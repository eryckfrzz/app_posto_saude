import 'package:floor/floor.dart';

@Entity(tableName: 'user')
class User {
  @primaryKey
  String cpf;
  String name;
  int phone;

  @ColumnInfo(name: 'agentCpf')
  final String? agentCpf;

  User(this.agentCpf, {required this.name, required this.cpf, required this.phone});
}
