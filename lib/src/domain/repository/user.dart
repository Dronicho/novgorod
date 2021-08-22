import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/domain/repository/base.dart';

class UserRepository extends BaseRepository {
  Future<User?> getUser() async {
    try {
      // return User.empty;
      var res = await api.client.get(api.baseUrl + '/user');
      print(res.data);
      return User.fromJson(res.data['user']);
    } catch (err) {
      print(err);
    }
  }
}
