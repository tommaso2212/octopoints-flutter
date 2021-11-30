import 'package:octopoints/model/data/team/JoiningTeam.dart';
import 'package:octopoints/model/data/team/Team.dart';
import 'package:octopoints/model/data/team/TeamDao.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';
import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/model/data/user/UserDao.dart';

class TeamDataAccess {
  final TeamDao _teamDao;
  final UserDao _userDao;

  TeamDataAccess(this._teamDao, this._userDao);

  Future<int> createTeam(int matchId) async {
    return await _teamDao.insertTeam(Team(matchId: matchId));
  }

  Future<List<TeamWithUsers>> getTeams(int matchId) async {
    return await _teamDao.getTeamWithUsers(matchId);
  }

  Future<void> deleteTeam(Team team) async {
    await _teamDao.deleteTeam(team);
  }

  Future<void> updateTeam(Team team) async {
    await _teamDao.updateTeam(team);
  }

  Future<List<User>> getUsers() async {
    return await _userDao.getUsers();
  }

  Future<void> joinTeam(int teamId, int userId) async {
    await _teamDao.joinTeam(JoiningTeam(teamId, userId));
  }

  Future<void> leaveTeam(int teamId, int userId) async {
    await _teamDao.leaveTeam(JoiningTeam(teamId, userId));
  }
}
