import 'dart:async';

import 'package:floor/floor.dart';
import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/model/data/match/MatchDao.dart';
import 'package:octopoints/model/data/team/JoiningTeam.dart';
import 'package:octopoints/model/data/team/Team.dart';
import 'package:octopoints/model/data/team/TeamDao.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';
import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/model/data/user/UserDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'AppDatabase.g.dart';

@Database(version: 1, entities: [User, Match, Team, JoiningTeam])
abstract class AppDatabase extends FloorDatabase {
  MatchDao get matchDao;
  UserDao get userDao;
  TeamDao get teamDao;
}
