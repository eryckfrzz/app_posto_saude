// import 'package:app_posto/shared/features/user/domain/entities/agent_entity.dart';
// import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';
// import 'package:floor/floor.dart';

// @Entity(
//   tableName: 'agent_user',
//   primaryKeys: ['agentCpf', 'userCpf'],
//   foreignKeys: [
//     ForeignKey(
//       childColumns: ['agentCpf'],
//       parentColumns: ['cpf'],
//       entity: Agent,
//       onDelete: ForeignKeyAction.cascade,
//     ),
//     ForeignKey(
//       childColumns: ['userCpf'],
//       parentColumns: ['cpf'],
//       entity: User,
//       onDelete: ForeignKeyAction.cascade,
//     ),
//   ],
// )
// class AgentUserEntity {
//   final String agentCpf;
//   final String userCpf;

//   AgentUserEntity({required this.agentCpf, required this.userCpf});
// }
