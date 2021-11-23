import 'AppDatabase.dart';

class DataAccess {
  late final db;
  late final matchDao;
  late final teamDao;
  late final userDao;

  initDb() async {
    this.db = await $FloorAppDatabase.databaseBuilder('octopoints-db').build();
    this.matchDao = this.db.matchDao;
    this.teamDao = this.db.teamDao;
    this.userDao = this.db.userDao;
  }
}
