import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/domain/repository/base.dart';

class RouteRepository extends BaseRepository {
  Future<List<Route>> getRoutes() async {
    final res = await api.client.get(api.baseUrl + '/routes');
    return res.data['routes']
        .map((e) => Route.fromJson(e))
        .toList()
        .cast<Route>();
  }
}
