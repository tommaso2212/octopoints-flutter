import 'package:floor/floor.dart';
import 'package:octopoints/model/data/team/JoiningTeam.dart';
import 'package:octopoints/model/data/team/Team.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';
import 'package:octopoints/model/data/user/User.dart';

@dao
abstract class TeamDao {
  @insert
  Future<int> insertTeam(Team team);

  @update
  Future<void> updateTeam(Team team);

  @delete
  Future<void> deleteTeam(Team team);

  @insert
  Future<void> joinTeam(JoiningTeam joiningTeam);

  @delete
  Future<void> leaveTeam(JoiningTeam joiningTeam);

  @Query('SELECT * FROM teams WHERE matchId=:id')
  Future<List<Team>> getTeamsByMatchId(int id);

  @Query(
      'SELECT U.* FROM users U, joiningteam J WHERE J.teamId=:id AND J.userId=U.id')
  Future<List<User>> getTeammates(int id);

  @transaction
  Future<List<TeamWithUsers>> getTeamWithUsers(int id) async {
    List<Team> teams = await getTeamsByMatchId(id);
    List<TeamWithUsers> teamWithUsers = [];
    teams.forEach((team) async {
      teamWithUsers.add(TeamWithUsers(team, await getTeammates(team.id!)));
    });
    return teamWithUsers;
  }
}
