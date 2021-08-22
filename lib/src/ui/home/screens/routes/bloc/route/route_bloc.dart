import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/direction_repository.dart';
import 'package:test_map/src/ui/home/screens/routes/bloc/route_repository.dart';

import 'route_state.dart';

class RouteBloc extends Cubit<RouteState> {
  RouteBloc() : super(RouteLoading());

  final RouteRepository _repository = RouteRepository();
  final DirectionsRepository _directionsRepository = DirectionsRepository();

  Future<void> loadRoute(String routeId) async {
    emit(RouteLoading());
    final res = await _repository.getRouteById(routeId);
    final dir = await _directionsRepository.getDirections(
        origin: res.steps![0].point!.coordinates.toLatLng(),
        destination: res.steps![1].point!.coordinates.toLatLng());
    emit(RouteLoaded(res, dir));
  }
}
