import 'package:octopoints/model/data/team/JoiningTeam.dart';
import 'package:octopoints/model/data/team/Team.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';
import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/model/dataaccess/DataAccess.dart';

class TeamDataAccess extends DataAccess {
  Future<int> createTeam(int matchId) async {
    return await teamDao.insertTeam(Team(matchId: matchId));
  }

  Future<List<TeamWithUsers>> getTeams(int matchId) async {
    return await teamDao.getTeamWithUsers(matchId);
  }

  Future<void> deleteTeam(Team team) async {
    await teamDao.deleteTeam(team);
  }

  Future<void> updateTeam(Team team) async {
    await teamDao.updateTeam(team);
  }

  Future<List<User>> getUsers() async {
    return await userDao.getUsers();
  }

  Future<void> joinTeam(int teamId, int userId) async {
    await teamDao.joinTeam(JoiningTeam(teamId, userId));
  }

  Future<void> leaveTeam(int teamId, int userId) async {
    await teamDao.leaveTeam(JoiningTeam(teamId, userId));
  }
}
