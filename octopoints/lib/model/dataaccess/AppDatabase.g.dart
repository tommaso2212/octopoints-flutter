// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MatchDao? _matchDaoInstance;

  UserDao? _userDaoInstance;

  TeamDao? _teamDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `username` TEXT NOT NULL, `win` INTEGER NOT NULL, `draw` INTEGER NOT NULL, `lose` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `matches` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `description` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `teams` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `matchId` INTEGER NOT NULL, `partial` INTEGER NOT NULL, `total` INTEGER NOT NULL, FOREIGN KEY (`matchId`) REFERENCES `matches` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `joiningteam` (`teamId` INTEGER, `userId` INTEGER, FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (`teamId`, `userId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MatchDao get matchDao {
    return _matchDaoInstance ??= _$MatchDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  TeamDao get teamDao {
    return _teamDaoInstance ??= _$TeamDao(database, changeListener);
  }
}

class _$MatchDao extends MatchDao {
  _$MatchDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _matchInsertionAdapter = InsertionAdapter(
            database,
            'matches',
            (Match item) => <String, Object?>{
                  'id': item.id,
                  'description': item.description
                }),
        _matchDeletionAdapter = DeletionAdapter(
            database,
            'matches',
            ['id'],
            (Match item) => <String, Object?>{
                  'id': item.id,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Match> _matchInsertionAdapter;

  final DeletionAdapter<Match> _matchDeletionAdapter;

  @override
  Future<List<Match>> getMatches() async {
    return _queryAdapter.queryList('SELECT * FROM matches',
        mapper: (Map<String, Object?> row) => Match(
            id: row['id'] as int?, description: row['description'] as String));
  }

  @override
  Future<Match?> getMatchById(int id) async {
    return _queryAdapter.query('SELECT * FROM matches WHERE id=?1',
        mapper: (Map<String, Object?> row) => Match(
            id: row['id'] as int?, description: row['description'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertMatch(Match match) {
    return _matchInsertionAdapter.insertAndReturnId(
        match, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMatch(Match match) async {
    await _matchDeletionAdapter.delete(match);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'win': item.win,
                  'draw': item.draw,
                  'lose': item.lose
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'users',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'win': item.win,
                  'draw': item.draw,
                  'lose': item.lose
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'users',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'win': item.win,
                  'draw': item.draw,
                  'lose': item.lose
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> getUsers() async {
    return _queryAdapter.queryList('SELECT * FROM users',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            username: row['username'] as String,
            win: row['win'] as int,
            draw: row['draw'] as int,
            lose: row['lose'] as int));
  }

  @override
  Future<int> insertUser(User user) {
    return _userInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUsers(List<User> users) async {
    await _userUpdateAdapter.updateList(users, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(User user) async {
    await _userDeletionAdapter.delete(user);
  }
}

class _$TeamDao extends TeamDao {
  _$TeamDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _teamInsertionAdapter = InsertionAdapter(
            database,
            'teams',
            (Team item) => <String, Object?>{
                  'id': item.id,
                  'matchId': item.matchId,
                  'partial': item.partial,
                  'total': item.total
                }),
        _joiningTeamInsertionAdapter = InsertionAdapter(
            database,
            'joiningteam',
            (JoiningTeam item) => <String, Object?>{
                  'teamId': item.teamId,
                  'userId': item.userId
                }),
        _teamUpdateAdapter = UpdateAdapter(
            database,
            'teams',
            ['id'],
            (Team item) => <String, Object?>{
                  'id': item.id,
                  'matchId': item.matchId,
                  'partial': item.partial,
                  'total': item.total
                }),
        _teamDeletionAdapter = DeletionAdapter(
            database,
            'teams',
            ['id'],
            (Team item) => <String, Object?>{
                  'id': item.id,
                  'matchId': item.matchId,
                  'partial': item.partial,
                  'total': item.total
                }),
        _joiningTeamDeletionAdapter = DeletionAdapter(
            database,
            'joiningteam',
            ['teamId', 'userId'],
            (JoiningTeam item) => <String, Object?>{
                  'teamId': item.teamId,
                  'userId': item.userId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Team> _teamInsertionAdapter;

  final InsertionAdapter<JoiningTeam> _joiningTeamInsertionAdapter;

  final UpdateAdapter<Team> _teamUpdateAdapter;

  final DeletionAdapter<Team> _teamDeletionAdapter;

  final DeletionAdapter<JoiningTeam> _joiningTeamDeletionAdapter;

  @override
  Future<List<Team>> getTeamsByMatchId(int id) async {
    return _queryAdapter.queryList('SELECT * FROM teams WHERE matchId=?1',
        mapper: (Map<String, Object?> row) => Team(
            id: row['id'] as int?,
            matchId: row['matchId'] as int,
            partial: row['partial'] as int,
            total: row['total'] as int),
        arguments: [id]);
  }

  @override
  Future<List<User>> getTeammates(int id) async {
    return _queryAdapter.queryList(
        'SELECT U.* FROM users U, joiningteam J WHERE J.teamId=?1 AND J.userId=U.id',
        mapper: (Map<String, Object?> row) => User(id: row['id'] as int?, username: row['username'] as String, win: row['win'] as int, draw: row['draw'] as int, lose: row['lose'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertTeam(Team team) {
    return _teamInsertionAdapter.insertAndReturnId(
        team, OnConflictStrategy.abort);
  }

  @override
  Future<void> joinTeam(JoiningTeam joiningTeam) async {
    await _joiningTeamInsertionAdapter.insert(
        joiningTeam, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTeam(Team team) async {
    await _teamUpdateAdapter.update(team, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTeam(Team team) async {
    await _teamDeletionAdapter.delete(team);
  }

  @override
  Future<void> leaveTeam(JoiningTeam joiningTeam) async {
    await _joiningTeamDeletionAdapter.delete(joiningTeam);
  }

  @override
  Future<List<TeamWithUsers>> getTeamWithUsers(int id) async {
    if (database is sqflite.Transaction) {
      return super.getTeamWithUsers(id);
    } else {
      return (database as sqflite.Database)
          .transaction<List<TeamWithUsers>>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        return transactionDatabase.teamDao.getTeamWithUsers(id);
      });
    }
  }
}
