import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/ui/provider/CustomProvider.dart';

class UserProvider extends CustomProvider<User> {
  @override
  void loadData() {
    dataAccess.userDataAccess.getUsers().then((value) {
      data = value;
      notifyListeners();
    });
  }

  void createUser(String username) {
    dataAccess.userDataAccess.createUser(username).then((value) => loadData());
  }

  void deleteUser(User user) {
    dataAccess.userDataAccess.deleteUser(user).then((value) => loadData());
  }
}
