import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route_state.dart';

class FindRouteBloc extends Cubit<FindRouteState> {
  FindRouteBloc()
      : super(FindRouteState(
        duration: 30,
            companyType: 'В одиночку', travelType: 'Пешком', needEat: false));

  void updateRoute(FindRouteState state) {
    emit(state);
  }
}
