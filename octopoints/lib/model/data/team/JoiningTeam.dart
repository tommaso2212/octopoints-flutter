import 'package:floor/floor.dart';
import 'package:octopoints/model/data/team/Team.dart';
import 'package:octopoints/model/data/user/User.dart';

@Entity(tableName: 'joiningteam', primaryKeys: [
  'teamId',
  'userId'
], foreignKeys: [
  ForeignKey(
      childColumns: ['teamId'],
      parentColumns: ['id'],
      entity: Team,
      onDelete: ForeignKeyAction.cascade),
  ForeignKey(
      childColumns: ['userId'],
      parentColumns: ['id'],
      entity: User,
      onDelete: ForeignKeyAction.cascade)
])
class JoiningTeam {
  final int? teamId;
  final int? userId;

  JoiningTeam(this.teamId, this.userId);
}
