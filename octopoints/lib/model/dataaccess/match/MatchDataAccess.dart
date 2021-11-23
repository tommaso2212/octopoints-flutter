import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/model/dataaccess/DataAccess.dart';

class MatchDataAccess extends DataAccess{

  Future<int> createMatch(String description) async {
    return await matchDao.insertMatch(Match(description: description));
  }

  Future<List<Match>> getMatches() async {
    return await matchDao.getMatches();
  }

  Future<void> deleteMatch(Match match) async {
    return await matchDao.deleteMatch(match);
  }
}