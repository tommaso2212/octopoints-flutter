import 'package:floor/floor.dart';
import 'package:octopoints/model/data/match/Match.dart';

@dao
abstract class MatchDao {
  @insert
  Future<int> insertMatch(Match match);

  @delete
  Future<void> deleteMatch(Match match);

  @Query('SELECT * FROM matches')
  Future<List<Match>> getMatches();

  @Query('SELECT * FROM matches WHERE id=:id')
  Future<Match?> getMatchById(int id);
}
