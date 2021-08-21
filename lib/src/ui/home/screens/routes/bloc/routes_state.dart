import 'package:test_map/src/domain/models/user.dart';

abstract class RoutesState {}

class RoutesLoaded extends RoutesState {
  RoutesLoaded(this.routes);

  final List<Route> routes;

}

class RoutesLoading extends RoutesState {}
