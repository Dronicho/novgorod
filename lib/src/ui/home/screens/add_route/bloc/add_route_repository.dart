import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/domain/repository/base.dart';

class AddRouteRepository extends BaseRepository {
  Future<void> createPoint(LocalPoint point) async {
    final data = point.toJson();
    if (point.file != null) {
      data.addAll({'photoURL': point.file!.url});
    }
    final res = await api.client.post(api.baseUrl + '/point', data: data);
    print(res.data);
  }
}
