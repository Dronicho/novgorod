import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_map/src/widgets/input_fields/upload_field.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole { user, moderator }

@freezed
class User with _$User {
  const factory User(
      {required String id,
      required String name,
      String? email,
      String? phone,
      required int exp,
      @JsonKey(name: 'photoURL') required String photoUrl,
      required int level,
      List<Route>? completedStories,
      required List<Achievement> achievements,
      required UserRole role}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const empty = User(
      achievements: [],
      id: 'id',
      name: 'name,,',
      exp: 0,
      photoUrl: 'photoUrl',
      level: 0,
      role: UserRole.user);
}

@freezed
class Achievement with _$Achievement {
  const factory Achievement(
      {required String id,
      required String name,
      required String description,
      required int exp,
      required int icon}) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

@freezed
class Route with _$Route {
  const factory Route(
      {required String id,
      required String name,
      required String description,
      required int duration,
      required int exp,
      List<Step>? steps,
      required List<String> tags,
      List<Comment>? comments}) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}

@freezed
class Step with _$Step {
  const factory Step({
    required String name,
    required String description,
    Point? point,
    @JsonKey(name: 'photoURL') String? photoUrl,
  }) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment(
      {required String id,
      required String text,
      required String authorId,
      required DateTime date,
      required int likes}) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class Coordinate with _$Coordinate {
  const factory Coordinate({required double lat, required double lng}) =
      _Coordinate;

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);
}

@freezed
class Point with _$Point {
  const factory Point(
      {String? id,
      required String authorId,
      required String name,
      @JsonKey(name: 'photoURL') String? photoUrl,
      String? howToGet,
      required String type,
      List<String>? tags,
      required Coordinate coordinates,
      String? description,
      String? website,
      List<Comment>? comments,
      required int likes}) = _Point;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}

@freezed
class LocalPoint with _$LocalPoint {
  const factory LocalPoint(
      {String? name,
      @JsonKey(ignore: true) SendingAttachment? file,
      String? type,
      required List<String> tags,
      required Coordinate coordinate,
      String? description,
      String? website}) = _LocalPoint;

  factory LocalPoint.fromJson(Map<String, dynamic> json) =>
      _$LocalPointFromJson(json);
}
