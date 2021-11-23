import 'package:floor/floor.dart';
import 'package:octopoints/model/data/user/User.dart';

@dao
abstract class UserDao {
  @insert
  Future<int> insertUser(User user);

  @update
  Future<void> updateUsers(List<User> users);

  @delete
  Future<void> deleteUser(User user);

  @Query('SELECT * FROM users')
  Future<List<User>> getUsers();
}
