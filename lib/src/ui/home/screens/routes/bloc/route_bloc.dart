import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/ui/home/screens/routes/bloc/route_state.dart';

import 'route_repository.dart';

class RouteCubit extends Cubit<RouteState> {
  RouteCubit() : super(RouteLoading());

  final RouteRepository _repository = RouteRepository();

  Future<void> loadRoutes() async {
    emit(RouteLoading());
    final res = await _repository.getRoutes();
    emit(RouteLoaded(res));
  }
}
