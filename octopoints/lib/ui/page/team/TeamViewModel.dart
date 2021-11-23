import 'package:octopoints/model/data/team/Team.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';
import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/model/dataaccess/team/TeamDataAccess.dart';
import 'package:octopoints/ui/common/CommonViewModel.dart';

class TeamViewModel extends CommonViewModel<TeamWithUsers> {
  final int matchId;
  TeamViewModel(this.matchId) : super(TeamDataAccess());

  @override
  loadData() async {
    data = await (dataAccess as TeamDataAccess).getTeams(this.matchId);
    super.loadData();
  }

  Future<List<User>> getAvailableUsers() async {
    List<User> users = await (dataAccess as TeamDataAccess).getUsers();
    for (TeamWithUsers team in data) {
      team.users.forEach((user) {
        users.removeWhere((element) => user.id == element.id);
      });
    }
    return users;
  }

  Future<int> createTeam() async {
    int id = await (dataAccess as TeamDataAccess).createTeam(this.matchId);
    loadData();
    return id;
  }

  Future<void> deleteTeam(Team team) async {
    await (dataAccess as TeamDataAccess).deleteTeam(team);
    loadData();
  }

  Future<void> updateTeam(Team team) async {
    await (dataAccess as TeamDataAccess).updateTeam(team);
    loadData();
  }

  Future<void> leaveTeam(int teamId, int userId) async {
    await (dataAccess as TeamDataAccess).leaveTeam(teamId, userId);
    loadData();
  }

  Future<void> joinTeam(int teamId, int userId) async {
    await (dataAccess as TeamDataAccess).joinTeam(teamId, userId);
    loadData();
  }
}
