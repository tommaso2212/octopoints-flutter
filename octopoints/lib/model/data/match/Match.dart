import 'package:floor/floor.dart';

@Entity(tableName: 'matches')
class Match{
  @PrimaryKey(autoGenerate: true)
  int? id;
  String description;

  Match({this.id, required this.description});
}
