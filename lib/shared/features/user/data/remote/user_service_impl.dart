import 'dart:convert';

import 'package:app_posto/shared/features/user/data/remote/user_service_dao.dart';
import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart'
    hide User;
import 'package:app_posto/shared/features/user/data/models/user.dart';
import 'package:app_posto/utils/url.dart';
import 'package:dio/dio.dart';

class UserServiceImpl extends UserServiceDao {
  final Dio dio = Dio();
  @override
  Future<User?> registerRecord({
    required String name,
    required String birthday,
    required String gender,
    required String moreInfo,
  }) async {
    try {
      final response = await dio.post(
        '$url/registerRecord',
        data: {
          'name': name,
          'birthday': birthday,
          'gender': gender,
          'moreInfo': moreInfo,
        },
      );

      if (response.statusCode == 200) {
        print('Ficha registrada com sucesso!');

        Map<String, dynamic> data = json.decode(response.data);
        return User.fromJson(data);
      } else {
        print('Falha ao registrar a ficha!');
      }
    } catch (e) {
      print('Erro!');
      print(e);
    }

    return null;
  }

  @override
  Future<User?> registerUser({
    required String cpf,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await dio.post(
        '$url/register',
        data: {'cpf': cpf, 'name': name, 'phone': phone},
      );

      if (response.statusCode == 200) {
        print('Usuário registrada com sucesso!');

        Map<String, dynamic> data = json.decode(response.data);
        return User.fromJson(data);
      } else {
        print('Falha ao registrar o usuário!');
      }
    } catch (e) {
      print('Erro!');
      print(e);
    }

    return null;
  }

  @override
  Future<List<User?>> getAllUsers() async {
    try {
      final response = await dio.get('$url/users');

      if (response.statusCode == 200) {
        List<User> users = [];
        List<dynamic> listDynamic = json.decode(response.data);

        for (var jsonMap in listDynamic) {
          users.add(User.fromJson(jsonMap));
        }

        return users;
      } else {
        print('Falha ao buscar todos os usuários!');
      }
    } catch (e) {
      print('Erro!');
      print(e);
    }

    return [];
  }
}
