import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String username;
  int win;
  int draw;
  int lose;

  User(
      {this.id,
      required this.username,
      this.win = 0,
      this.draw = 0,
      this.lose = 0});
}
