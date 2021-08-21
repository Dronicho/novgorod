import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/domain/repository/base.dart';

class RouteRepository extends BaseRepository {
  Future<Route> getRouteById(String id) async {
    final res = await api.client.get(api.baseUrl + '/route/' + id);
    print(res.data);
    return Route.fromJson(res.data['route']);
  }

  Future<List<Route>> getRoutes() async {
    final res = await api.client.get(api.baseUrl + '/routes');
    print(res.data);
    return res.data['routes']
        .map((e) => Route.fromJson(e))
        .toList()
        .cast<Route>();
  }
}
