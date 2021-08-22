import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/domain/repository/base.dart';

class AddPointRepository extends BaseRepository {
  Future<void> createPoint(LocalPoint point) async {
    final data = point.toJson();
    if (point.file != null) {
      data.addAll({'photoURL': point.file!.url});
    }
    final res = await api.client.post(api.baseUrl + '/point', data: data);
    print(res.data);
  }

  Future<void> createRoute(LocalRoute route) async {
    final data = route.toJson();
    data['steps'] = (route.steps ?? []).map((e) {
      var r = e.toJson();
      if (e.file != null) {
        r['photoUrl'] = e.file!.url;
      }
      return r;
    }).toList();
    if (route.file != null) data['photoUrl'] = route.file!.url;
    print(data);
    final res = await api.client.post(api.baseUrl + '/route', data: data);
    print(res.data);
  }
}
