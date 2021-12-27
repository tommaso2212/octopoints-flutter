import 'package:octopoints/model/AppDatabase.dart';
import 'package:octopoints/model/entity/JoinTeamEntity.dart';
import 'package:octopoints/model/entity/TeamEntity.dart';
import 'package:octopoints/viewmodel/cache/User.dart';

class TeamWithUsers extends TeamEntity {
  List<User> _users;

  TeamWithUsers(TeamEntity teamEntity, this._users)
      : super(
          teamEntity.id,
          teamEntity.matchId,
          teamEntity.partial,
          teamEntity.total,
        );

  List<User> get users => this._users;

  void join(User user) =>
      AppDatabase().joinTeamDao.create(JoinTeamEntity(this.id, user.id)).then(
            (_) => _users.add(user),
          );

  void leave(User user) =>
      AppDatabase().joinTeamDao.leaveTeam(this.id, user.id).then(
            (_) => _users.removeWhere((element) => element.id == user.id),
          );

  TeamEntity _setTotal(int newTotal) =>
      TeamEntity(this.id, this.matchId, this.partial, newTotal);
  TeamEntity _setPartial(int newPartial) =>
      TeamEntity(this.id, this.matchId, newPartial, this.total);

  void setTotal(int newTotal) =>
      AppDatabase().teamDao.modify([this._setTotal(newTotal)]).then(
        (_) => this.total = newTotal,
      );

  void setPartial(int newPartial) =>
      AppDatabase().teamDao.modify([this._setPartial(newPartial)]).then(
        (_) => this.partial = newPartial,
      );
}
