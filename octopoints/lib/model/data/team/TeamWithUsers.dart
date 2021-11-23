import 'package:octopoints/model/data/team/Team.dart';
import 'package:octopoints/model/data/user/User.dart';

class TeamWithUsers{
  Team team;
  List<User> users;

  TeamWithUsers(this.team, this.users);
}