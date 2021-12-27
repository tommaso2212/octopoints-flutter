import 'package:octopoints/model/AppDatabase.dart';
import 'package:octopoints/model/entity/MatchEntity.dart';
import 'package:octopoints/model/entity/TeamEntity.dart';
import 'package:octopoints/viewmodel/cache/TeamWithUsers.dart';
import 'package:octopoints/viewmodel/cache/User.dart';

class MatchWithTeams extends MatchEntity {
  List<TeamWithUsers>? _teams;

  MatchWithTeams(MatchEntity matchEntity, this._teams)
      : super(
          matchEntity.id,
          matchEntity.description,
        );

  Future<List<TeamWithUsers>> get teams async {
    if (_teams == null) {
      _teams = [];
      List<TeamEntity> list =
          await AppDatabase().teamDao.getTeamsByMatchId(this.id);
      list.forEach((element) async {
        List<User> users =
            (await AppDatabase().joinTeamDao.getTeammates(element.id))
                .map((e) => User(e))
                .toList();
        _teams!.add(TeamWithUsers(element, users));
      });
    }
    return _teams!;
  }

  void addTeam() =>
      AppDatabase().teamDao.create(TeamEntity.insert(this.id)).then(
            (teamId) => AppDatabase().teamDao.getTeamById(teamId).then(
                  (teamEntity) => _teams!.add(TeamWithUsers(teamEntity, [])),
                ),
          );

  void deleteTeam(TeamEntity team) => AppDatabase().teamDao.remove(team).then(
        (_) => _teams!.removeWhere((element) => element.id == team.id),
      );
}
