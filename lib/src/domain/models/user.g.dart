// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    exp: json['exp'] as int,
    photoUrl: json['photoURL'] as String,
    level: json['level'] as int,
    completedStories: (json['completedStories'] as List<dynamic>?)
        ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
        .toList(),
    achievements: (json['achievements'] as List<dynamic>)
        .map((e) => Achievement.fromJson(e as Map<String, dynamic>))
        .toList(),
    role: _$enumDecode(_$UserRoleEnumMap, json['role']),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'exp': instance.exp,
      'photoURL': instance.photoUrl,
      'level': instance.level,
      'completedStories': instance.completedStories,
      'achievements': instance.achievements,
      'role': _$UserRoleEnumMap[instance.role],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$UserRoleEnumMap = {
  UserRole.user: 'user',
  UserRole.moderator: 'moderator',
};

_$_Achievement _$_$_AchievementFromJson(Map<String, dynamic> json) {
  return _$_Achievement(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    exp: json['exp'] as int,
    icon: json['icon'] as int,
  );
}

Map<String, dynamic> _$_$_AchievementToJson(_$_Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'exp': instance.exp,
      'icon': instance.icon,
    };

_$_Route _$_$_RouteFromJson(Map<String, dynamic> json) {
  return _$_Route(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    duration: json['duration'] as int,
    exp: json['exp'] as int,
    steps: (json['steps'] as List<dynamic>?)
        ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
        .toList(),
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    comments: (json['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_RouteToJson(_$_Route instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'exp': instance.exp,
      'steps': instance.steps,
      'tags': instance.tags,
      'comments': instance.comments,
    };

_$_Step _$_$_StepFromJson(Map<String, dynamic> json) {
  return _$_Step(
    name: json['name'] as String,
    description: json['description'] as String,
    point: json['point'] == null
        ? null
        : Point.fromJson(json['point'] as Map<String, dynamic>),
    photoUrl: json['photoURL'] as String?,
  );
}

Map<String, dynamic> _$_$_StepToJson(_$_Step instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'point': instance.point,
      'photoURL': instance.photoUrl,
    };

_$_Comment _$_$_CommentFromJson(Map<String, dynamic> json) {
  return _$_Comment(
    id: json['id'] as String,
    text: json['text'] as String,
    authorId: json['authorId'] as String,
    date: DateTime.parse(json['date'] as String),
    likes: json['likes'] as int,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'authorId': instance.authorId,
      'date': instance.date.toIso8601String(),
      'likes': instance.likes,
    };

_$_Coordinate _$_$_CoordinateFromJson(Map<String, dynamic> json) {
  return _$_Coordinate(
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_CoordinateToJson(_$_Coordinate instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$_Point _$_$_PointFromJson(Map<String, dynamic> json) {
  return _$_Point(
    id: json['id'] as String?,
    authorId: json['authorId'] as String,
    name: json['name'] as String,
    photoUrl: json['photoURL'] as String?,
    howToGet: json['howToGet'] as String?,
    type: json['type'] as String,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    coordinates:
        Coordinate.fromJson(json['coordinates'] as Map<String, dynamic>),
    description: json['description'] as String?,
    website: json['website'] as String?,
    comments: (json['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
    likes: json['likes'] as int,
  );
}

Map<String, dynamic> _$_$_PointToJson(_$_Point instance) => <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'name': instance.name,
      'photoURL': instance.photoUrl,
      'howToGet': instance.howToGet,
      'type': instance.type,
      'tags': instance.tags,
      'coordinates': instance.coordinates,
      'description': instance.description,
      'website': instance.website,
      'comments': instance.comments,
      'likes': instance.likes,
    };

_$_LocalPoint _$_$_LocalPointFromJson(Map<String, dynamic> json) {
  return _$_LocalPoint(
    name: json['name'] as String?,
    type: json['type'] as String?,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    coordinate: Coordinate.fromJson(json['coordinate'] as Map<String, dynamic>),
    description: json['description'] as String?,
    website: json['website'] as String?,
  );
}

Map<String, dynamic> _$_$_LocalPointToJson(_$_LocalPoint instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'tags': instance.tags,
      'coordinate': instance.coordinate,
      'description': instance.description,
      'website': instance.website,
    };
