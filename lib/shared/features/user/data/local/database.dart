import 'dart:async';

import 'package:app_posto/shared/features/user/data/local/database_dao.dart';
import 'package:app_posto/shared/features/user/domain/entities/agent_entity.dart';
import 'package:app_posto/shared/features/user/domain/entities/agent_user_entity.dart';
import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [User, Agent]) 
abstract class AppDatabase extends FloorDatabase{
  DatabaseDao get databaseDao;
}