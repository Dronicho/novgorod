class FindRouteState {
  final String travelType;
  final String companyType;
  final bool needEat;
  final int duration;

  FindRouteState(
      {required this.travelType,
      required this.duration,
      required this.companyType,
      required this.needEat});

  FindRouteState copyWith(
          {String? travelType, String? companyType, bool? needEat, int? duration}) =>
      FindRouteState(
          needEat: needEat ?? this.needEat,
          duration: duration ?? this.duration,
          travelType: travelType ?? this.travelType,
          companyType: companyType ?? this.companyType);
}
