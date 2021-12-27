import 'package:floor/floor.dart';
import 'package:octopoints/model/dao/IDao.dart';
import 'package:octopoints/model/entity/MatchEntity.dart';

@dao
abstract class MatchDao extends IDao<MatchEntity> {
  @override //Match cannot be modified
  Future<int> modify(List<MatchEntity> matchEntity) =>
      throw UnsupportedError('Match cannot be modified.');

  @Query('SELECT * FROM matches ORDER BY id DESC')
  Future<List<MatchEntity>> getAllMatches();

  @Query('SELECT * FROM matches WHERE id=:id')
  Future<MatchEntity> getMatchById(int id);
}
