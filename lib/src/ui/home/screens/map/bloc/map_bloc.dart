import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_repository.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_state.dart';

class MapBloc extends Cubit<MapState> {
  MapBloc() : super(MapLoading());

  final MapRepository _repository = MapRepository();

  Future<void> loadPoints() async {
    emit(MapLoading());
    final p = await _repository.getPoints();
    emit(MapLoaded(p));
  }
}
