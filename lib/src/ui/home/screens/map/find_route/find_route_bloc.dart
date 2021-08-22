import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route_repository.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route_state.dart';

class FindRouteBloc extends Cubit<FindRouteState> {
  FindRouteBloc()
      : super(FindRouteState(
            duration: 30,
            companyType: 'alone',
            travelType: 'walk',
            needEat: false));

  final FindRouteRepository _repository = FindRouteRepository();

  void updateRoute(FindRouteState state) {
    emit(state);
  }

  Future<List<Route>?> getRoute() async {
    return await _repository.getRoute(state);
  }
}
