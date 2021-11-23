import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/model/dataaccess/DataAccess.dart';

class UserDataAccess extends DataAccess {
  Future<int> createUser(String username) async {
    return await userDao.insertUser(User(username: username));
  }

  Future<List<User>> getUsers() async {
    return await userDao.getUsers();
  }

  Future<void> deleteUser(User user) async {
    return await userDao.deleteUser(user);
  }

  Future<void> updateUsers(List<User> users) async {
    return await userDao.updateUsers(users);
  }
}
