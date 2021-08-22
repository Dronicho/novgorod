import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/models/user.dart';

import 'add_route_repository.dart';

class AddRouteCubit extends Cubit<LocalRoute> {
  AddRouteCubit()
      : super(LocalRoute(
            duration: 15,
            exp: 150,
            type: 'walk',
            tags: [],
            name: '',
            description: ''));
  final AddPointRepository _repository = AddPointRepository();

  void updatePoint(LocalRoute route) {
    emit(route);
  }

  Future<void> createRoute() async {
    await _repository.createRoute(state);
  }
}
