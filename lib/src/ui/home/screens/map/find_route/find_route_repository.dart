import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/domain/repository/base.dart';

import 'find_route_state.dart';

class FindRouteRepository extends BaseRepository {
  Future<List<Route>?> getRoute(FindRouteState state) async {
    final res = await api.client.post(api.baseUrl + '/routes/choose', data: {
      'needFood': state.needEat,
      'duration': state.duration,
      'type': state.travelType,
      'company': state.companyType
    });
    if (res.data['routes'] != null) {
      return res.data['routes']
          .map((e) => Route.fromJson(e))
          .toList()
          .cast<Route>();
    } else {
      return null;
    }
  }
}
