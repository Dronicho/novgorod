import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/ui/home/screens/routes/bloc/routes_state.dart';

import 'route_repository.dart';

class RoutesCubit extends Cubit<RoutesState> {
  RoutesCubit() : super(RoutesLoading());

  final RouteRepository _repository = RouteRepository();

  Future<void> loadRoutes() async {
    emit(RoutesLoading());
    final res = await _repository.getRoutes();
    emit(RoutesLoaded(res));
  }
}
