import 'dart:ui';

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
