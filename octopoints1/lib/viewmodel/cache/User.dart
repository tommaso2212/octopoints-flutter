import 'package:octopoints/model/AppDatabase.dart';
import 'package:octopoints/model/entity/UserEntity.dart';

class User extends UserEntity {
  User(UserEntity userEntity)
      : super(
          userEntity.id,
          userEntity.username,
          userEntity.win,
          userEntity.lose,
          userEntity.draw,
        );

  UserEntity _incrementWin() =>
      UserEntity(this.id, this.username, this.win + 1, this.lose, this.draw);
  UserEntity _incrementLose() =>
      UserEntity(this.id, this.username, this.win, this.lose + 1, this.draw);
  UserEntity _incrementDraw() =>
      UserEntity(this.id, this.username, this.win, this.lose, this.draw + 1);

  int get win => super.win;
  set win(int win) => AppDatabase().userDao.modify([_incrementWin()]).then(
        (value) => this.win += 1,
      );

  int get lose => super.lose;
  set lose(int lose) => AppDatabase().userDao.modify([_incrementLose()]).then(
        (value) => this.lose += 1,
      );

  int get draw => super.draw;
  set draw(int draw) => AppDatabase().userDao.modify([_incrementDraw()]).then(
        (value) => this.draw += 1,
      );
}
