import 'package:floor/floor.dart';
import 'package:octopoints/model/data/match/Match.dart';

@Entity(tableName: 'teams', foreignKeys: [
  ForeignKey(childColumns: ['matchId'], parentColumns: ['id'], entity: Match)
])
class Team {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int matchId;
  int partial;
  int total;

  Team({this.id, required this.matchId, this.partial = 0, this.total = 0});
}
