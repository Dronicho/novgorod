import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/domain/repository/base.dart';

class MapRepository extends BaseRepository {
  Future<List<Point>> getPoints() async {
    final res = await api.client.get(api.baseUrl + '/points');
    print(res.data);
    return res.data['points']
        .map((e) => Point.fromJson(e))
        .toList()
        .cast<Point>();
  }

  Future<List<Point>> searchPoints(String search) async {
    if (search.isEmpty) return [];
    print(api.baseUrl + '/point/name/' + search);
    final res = await api.client.get(api.baseUrl + '/point/name/' + search);
    print(res.data);
    return res.data['points']
        .map((e) => Point.fromJson(e))
        .toList()
        .cast<Point>();
  }
}
