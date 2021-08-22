import 'package:test_map/direction_model.dart';
import 'package:test_map/src/domain/models/user.dart';

abstract class RouteState {}

class RouteLoading extends RouteState {}

class RouteLoaded extends RouteState {
  final Route route;
  final Directions? directions;

  RouteLoaded(this.route, this.directions);
}
