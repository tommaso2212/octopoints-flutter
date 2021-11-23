import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/model/dataaccess/user/UserDataAccess.dart';
import 'package:octopoints/ui/common/CommonViewModel.dart';

class UserViewModel extends CommonViewModel<User> {
  UserViewModel() : super(UserDataAccess());

  @override
  loadData() async {
    data = await (dataAccess as UserDataAccess).getUsers();
    super.loadData();
  }

  Future<int> createUser(String username) async {
    int id = await (dataAccess as UserDataAccess).createUser(username);
    loadData();
    return id;
  }

  Future<void> deleteUser(User user) async {
    await (dataAccess as UserDataAccess).deleteUser(user);
    loadData();
  }
}
