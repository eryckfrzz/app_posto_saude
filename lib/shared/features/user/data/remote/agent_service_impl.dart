import 'dart:convert';

import 'package:app_posto/shared/features/user/data/models/agent.dart';
import 'package:app_posto/shared/features/user/data/remote/agent_service_dao.dart';
import 'package:app_posto/shared/features/user/domain/entities/agent_entity.dart';
import 'package:app_posto/utils/url.dart';
import 'package:dio/dio.dart';

class AgentServiceImpl implements AgentServiceDao {
  final Dio dio = Dio();

  final String code = 'AGENT1234';

  @override
  Future<List<Agent?>> getAllAgents() async {
    try {
      final response = await dio.get('$url/agents');

      if (response.statusCode == 200) {
        List<Agent> agents = [];
        List<dynamic> listDynamic = json.decode(response.data);

        for (var jsonMap in listDynamic) {
          agents.add(Agent.fromJson(jsonMap));
        }

        return agents;
      } else {
        print('Falha ao buscar agentes!');
      }
    } catch (e) {
      print('Erro!');
      print(e);
    }

    return [];
  }

  @override
  Future<Agent?> registerAgent({
    required String cpf,
    required String name,
    required String email,
    required String password,
    required String agentCode,
  }) async {
    try {
      final response = await dio.post(
        '$url/registerAgent',
        data: {
          'cpf': cpf,
          'name': name,
          'email': email,
          'password': password,
          'agentCode': agentCode,
        },
      );

      if (response.statusCode == 200 && agentCode == code) {
        print('Agente registrado com suecsso!');

        Map<String, dynamic> map = json.decode(response.data);
        return Agent.fromJson(map);
      } else {
        print('Falha ao registrar o agente!');
      }
    } catch (e) {
      print('Erro!');
      print(e);
    }

    return null;
  }
}
