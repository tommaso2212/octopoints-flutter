import 'package:floor/floor.dart';
import 'package:octopoints/model/dao/IDao.dart';
import 'package:octopoints/model/entity/UserEntity.dart';

@dao
abstract class UserDao extends IDao<UserEntity> {
  @Query('SELECT * FROM users ORDER BY username')
  Future<List<UserEntity>> getAllUsers();

  @Query('SELECT * FROM users WHERE id=:id')
  Future<UserEntity> getUserById(int id);
}
