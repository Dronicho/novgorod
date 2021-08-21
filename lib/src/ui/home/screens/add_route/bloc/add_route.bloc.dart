import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/ui/home/screens/add_route/bloc/add_route_repository.dart';

class AddRouteBloc extends Cubit<LocalPoint> {
  AddRouteBloc()
      : super(LocalPoint(tags: [], coordinate: Coordinate(lat: 0, lng: 0), type: 'Достопримечательности'));

  final AddRouteRepository _repository = AddRouteRepository();

  void updatePoint(LocalPoint point) {
    emit(point);
  }

  Future<void> createPoint() async {
    await _repository.createPoint(state);
  }
}
