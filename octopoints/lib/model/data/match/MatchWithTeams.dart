import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';

class MatchWithTeams{
  Match match;
  List<TeamWithUsers> teams;

  MatchWithTeams(this.match, this.teams);
}