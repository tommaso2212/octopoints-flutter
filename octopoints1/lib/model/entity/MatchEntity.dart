import 'package:floor/floor.dart';

@Entity(tableName: 'matches')
class MatchEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? _id; //immutable
  @ColumnInfo(name: 'description')
  String _description; //immutable

  MatchEntity.insert(this._description);
  MatchEntity(this._id, this._description);

  int get id => this._id!;
  String get description => this._description;
}
