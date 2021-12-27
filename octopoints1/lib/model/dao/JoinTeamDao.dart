import 'package:floor/floor.dart';
import 'package:octopoints/model/dao/IDao.dart';
import 'package:octopoints/model/entity/JoinTeamEntity.dart';
import 'package:octopoints/model/entity/UserEntity.dart';

@dao
abstract class JoinTeamDao extends IDao<JoinTeamEntity> {
  @override //JoinTeam cannot be modified
  Future<int> modify(List<JoinTeamEntity> joinTeamEntities) =>
      throw UnsupportedError('JoinTeam cannot be modified.');

  @Query('DELETE FROM jointeam WHERE teamId=:teamId AND userId=:userId')
  Future<void> leaveTeam(int teamId, int userId);

  @Query(
      'SELECT U.* FROM users U, jointeam J WHERE J.teamId=:id AND J.userId=U.id')
  Future<List<UserEntity>> getTeammates(int teamId);
}
