import 'package:octopoints/model/AppDatabase.dart';
import 'package:octopoints/model/entity/MatchEntity.dart';
import 'package:octopoints/model/entity/UserEntity.dart';
import 'package:octopoints/viewmodel/cache/MatchWithTeams.dart';
import 'package:octopoints/viewmodel/cahce/User.dart';

class Cache {
  static List<User>? _users;
  static List<MatchWithTeams>? _matches;

  Cache._();

  static final Cache _instance = Cache._();

  factory Cache() => _instance;

  Future<List<User>> get users async {
    if (_users == null) {
      _users = (await AppDatabase().userDao.getAllUsers())
          .map((e) => User(e))
          .toList();
    }
    return _users!;
  }

  Future<List<MatchWithTeams>> get matches async {
    if (_matches == null) {
      _matches = (await AppDatabase().matchDao.getAllMatches())
          .map((e) => MatchWithTeams(e, []))
          .toList();
    }
    return _matches!;
  }

  Future<void> addMatch(String descrizione) =>
      AppDatabase().matchDao.create(MatchEntity.insert(descrizione)).then(
            (matchId) => AppDatabase().matchDao.getMatchById(matchId).then(
                  (matchEntity) =>
                      _matches!.add(MatchWithTeams(matchEntity, [])),
                ),
          );

  Future<void> deleteMatch(MatchEntity matchEntity) => AppDatabase()
      .matchDao
      .remove(matchEntity)
      .then(
        (_) => _matches!.removeWhere((element) => element.id == matchEntity.id),
      );

  Future<void> addUser(String username) =>
      AppDatabase().userDao.create(UserEntity.insert(username)).then(
            (userId) => AppDatabase().userDao.getUserById(userId).then(
                  (userEntity) => _users!.add(User(userEntity)),
                ),
          );

  Future<void> deleteUser(User user) => AppDatabase().userDao.remove(user).then(
        (_) => _users!.removeWhere((element) => element.id == user.id),
      );
}
