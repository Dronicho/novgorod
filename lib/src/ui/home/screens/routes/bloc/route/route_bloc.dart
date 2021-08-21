import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/ui/home/screens/routes/bloc/route_repository.dart';

import 'route_state.dart';

class RouteBloc extends Cubit<RouteState> {
  RouteBloc() : super(RouteLoading());

  final RouteRepository _repository = RouteRepository();

  Future<void> loadRoute(String routeId) async {
    emit(RouteLoading());
    final res = await _repository.getRouteById(routeId);
    emit(RouteLoaded(res));
  }
}
