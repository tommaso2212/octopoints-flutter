import 'AppDatabase.dart';
import 'MatchDataAccess.dart';
import 'UserDataAccess.dart';
import 'TeamDataAccess.dart';

class DataAccess {
  DataAccess._();

  static bool _isInitialized = false;

  static final DataAccess _singleton = DataAccess._();

  static Future<DataAccess> instance() async {
    if (_isInitialized) return Future.value(_singleton);
    await _singleton.initDb();
    _isInitialized = true;
    return Future.value(_singleton);
  }

  late MatchDataAccess matchDataAccess;
  late UserDataAccess userDataAccess;
  late TeamDataAccess teamDataAccess;

  Future<void> initDb() async {
    AppDatabase db =
        await $FloorAppDatabase.databaseBuilder('octopoints-db').build();
    this.matchDataAccess = MatchDataAccess(db.matchDao);
    this.userDataAccess = UserDataAccess(db.userDao);
    this.teamDataAccess = TeamDataAccess(db.teamDao, db.userDao);
  }
}
