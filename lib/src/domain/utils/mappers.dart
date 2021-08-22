import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_map/src/theme/color.dart';

Color mapDurationToColor(int duration) {
  if (duration < 30) {
    return primaryColor;
  } else if (duration < 60) {
    return green;
  } else if (duration < 120) {
    return rose;
  }
  return purple;
}

final mapTypeToIcon = {
  'bike': Icons.directions_bike,
  'walk': Icons.directions_walk,
  'car': Icons.directions_car
};
