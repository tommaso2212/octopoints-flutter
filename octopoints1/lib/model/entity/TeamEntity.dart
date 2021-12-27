import 'package:floor/floor.dart';
import 'package:octopoints/model/entity/MatchEntity.dart';

@Entity(tableName: 'teams', foreignKeys: [
  ForeignKey(
    childColumns: ['matchId'],
    parentColumns: ['id'],
    entity: MatchEntity,
    onDelete: ForeignKeyAction.cascade,
  )
])
class TeamEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? _id; //immutable

  @ColumnInfo(name: 'matchId')
  int _matchId; //immutable

  int partial = 0;

  int total = 0;

  TeamEntity.insert(this._matchId);
  TeamEntity(this._id, this._matchId, this.partial, this.total);

  int get id => this._id!;
  int get matchId => this._matchId;
}
