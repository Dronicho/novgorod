import 'package:flutter/material.dart';
import 'package:test_map/src/domain/models/user.dart';

abstract class MapState {}

class MapLoaded extends MapState {
  final List<Point> points;

  MapLoaded(this.points);
}

class MapLoading extends MapState {}
