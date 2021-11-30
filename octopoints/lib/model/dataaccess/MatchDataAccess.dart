import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/model/data/match/MatchDao.dart';

class MatchDataAccess {
  final MatchDao _matchDao;

  MatchDataAccess(this._matchDao);

  Future<int> createMatch(String description) async {
    return await this._matchDao.insertMatch(Match(description: description));
  }

  Future<List<Match>> getMatches() async {
    return await this._matchDao.getMatches();
  }

  Future<void> deleteMatch(Match match) async {
    return await this._matchDao.deleteMatch(match);
  }
}
