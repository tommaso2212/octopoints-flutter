import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class UserEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? _id; //immutable

  @ColumnInfo(name: 'username')
  String _username; //immutable

  int win = 0;

  int lose = 0;

  int draw = 0;

  UserEntity.insert(this._username);
  UserEntity(this._id, this._username, this.win, this.lose, this.draw);

  int get id => this._id!;
  String get username => this._username;
}
