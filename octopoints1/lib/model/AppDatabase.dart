import 'package:floor/floor.dart';
import 'package:octopoints/model/dao/JoinTeamDao.dart';
import 'package:octopoints/model/dao/MatchDao.dart';
import 'package:octopoints/model/dao/TeamDao.dart';
import 'package:octopoints/model/dao/UserDao.dart';
import 'package:octopoints/model/entity/JoinTeamEntity.dart';
import 'package:octopoints/model/entity/MatchEntity.dart';
import 'package:octopoints/model/entity/TeamEntity.dart';
import 'package:octopoints/model/entity/UserEntity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
//part 'AppDatabase.g.dart';

@Database(
    version: 1, entities: [UserEntity, MatchEntity, TeamEntity, JoinTeamEntity])
abstract class AppDatabase extends FloorDatabase {
  MatchDao get matchDao;
  UserDao get userDao;
  TeamDao get teamDao;
  JoinTeamDao get joinTeamDao;

  static late AppDatabase _instance;

  static Future init() async {
    //_instance =
    //    await $FloorAppDatabase.databaseBuilder('octopoints-db').build();
  }

  factory AppDatabase() => _instance;
}
