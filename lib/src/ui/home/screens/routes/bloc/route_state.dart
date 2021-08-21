import 'package:test_map/src/domain/models/user.dart';

abstract class RouteState {}

class RouteLoaded extends RouteState {
  RouteLoaded(this.routes);

  final List<Route> routes;

}

class RouteLoading extends RouteState {}
