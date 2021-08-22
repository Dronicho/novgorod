import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/ui/home/screens/add_route/bloc/add_route_repository.dart';

class AddStepBloc extends Cubit<LocalStep> {
  AddStepBloc(Point point)
      : super(LocalStep(pointId: point.id!, name: '', description: '', point: point));

  final AddPointRepository _repository = AddPointRepository();

  void updatePoint(LocalStep point) {
    emit(point);
  }
}
