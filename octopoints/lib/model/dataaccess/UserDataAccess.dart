import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/model/data/user/UserDao.dart';

class UserDataAccess {
  final UserDao _userDao;

  UserDataAccess(this._userDao);

  Future<int> createUser(String username) async {
    return await _userDao.insertUser(User(username: username));
  }

  Future<List<User>> getUsers() async {
    return await _userDao.getUsers();
  }

  Future<void> deleteUser(User user) async {
    return await _userDao.deleteUser(user);
  }

  Future<void> updateUsers(List<User> users) async {
    return await _userDao.updateUsers(users);
  }
}
