// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String id,
      required String name,
      String? email,
      String? phone,
      required int exp,
      @JsonKey(name: 'photoURL') required String photoUrl,
      required int level,
      List<Route>? completedStories,
      required List<Achievement> achievements,
      required UserRole role}) {
    return _User(
      id: id,
      name: name,
      email: email,
      phone: phone,
      exp: exp,
      photoUrl: photoUrl,
      level: level,
      completedStories: completedStories,
      achievements: achievements,
      role: role,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;
  @JsonKey(name: 'photoURL')
  String get photoUrl => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  List<Route>? get completedStories => throw _privateConstructorUsedError;
  List<Achievement> get achievements => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String? email,
      String? phone,
      int exp,
      @JsonKey(name: 'photoURL') String photoUrl,
      int level,
      List<Route>? completedStories,
      List<Achievement> achievements,
      UserRole role});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? exp = freezed,
    Object? photoUrl = freezed,
    Object? level = freezed,
    Object? completedStories = freezed,
    Object? achievements = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      exp: exp == freezed
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      completedStories: completedStories == freezed
          ? _value.completedStories
          : completedStories // ignore: cast_nullable_to_non_nullable
              as List<Route>?,
      achievements: achievements == freezed
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String? email,
      String? phone,
      int exp,
      @JsonKey(name: 'photoURL') String photoUrl,
      int level,
      List<Route>? completedStories,
      List<Achievement> achievements,
      UserRole role});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? exp = freezed,
    Object? photoUrl = freezed,
    Object? level = freezed,
    Object? completedStories = freezed,
    Object? achievements = freezed,
    Object? role = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      exp: exp == freezed
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      completedStories: completedStories == freezed
          ? _value.completedStories
          : completedStories // ignore: cast_nullable_to_non_nullable
              as List<Route>?,
      achievements: achievements == freezed
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {required this.id,
      required this.name,
      this.email,
      this.phone,
      required this.exp,
      @JsonKey(name: 'photoURL') required this.photoUrl,
      required this.level,
      this.completedStories,
      required this.achievements,
      required this.role});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final int exp;
  @override
  @JsonKey(name: 'photoURL')
  final String photoUrl;
  @override
  final int level;
  @override
  final List<Route>? completedStories;
  @override
  final List<Achievement> achievements;
  @override
  final UserRole role;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, exp: $exp, photoUrl: $photoUrl, level: $level, completedStories: $completedStories, achievements: $achievements, role: $role)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('exp', exp))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('completedStories', completedStories))
      ..add(DiagnosticsProperty('achievements', achievements))
      ..add(DiagnosticsProperty('role', role));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.exp, exp) ||
                const DeepCollectionEquality().equals(other.exp, exp)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.completedStories, completedStories) ||
                const DeepCollectionEquality()
                    .equals(other.completedStories, completedStories)) &&
            (identical(other.achievements, achievements) ||
                const DeepCollectionEquality()
                    .equals(other.achievements, achievements)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(exp) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(completedStories) ^
      const DeepCollectionEquality().hash(achievements) ^
      const DeepCollectionEquality().hash(role);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required String id,
      required String name,
      String? email,
      String? phone,
      required int exp,
      @JsonKey(name: 'photoURL') required String photoUrl,
      required int level,
      List<Route>? completedStories,
      required List<Achievement> achievements,
      required UserRole role}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  int get exp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'photoURL')
  String get photoUrl => throw _privateConstructorUsedError;
  @override
  int get level => throw _privateConstructorUsedError;
  @override
  List<Route>? get completedStories => throw _privateConstructorUsedError;
  @override
  List<Achievement> get achievements => throw _privateConstructorUsedError;
  @override
  UserRole get role => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}

Achievement _$AchievementFromJson(Map<String, dynamic> json) {
  return _Achievement.fromJson(json);
}

/// @nodoc
class _$AchievementTearOff {
  const _$AchievementTearOff();

  _Achievement call(
      {required String id,
      required String name,
      required String description,
      required int exp,
      required int icon}) {
    return _Achievement(
      id: id,
      name: name,
      description: description,
      exp: exp,
      icon: icon,
    );
  }

  Achievement fromJson(Map<String, Object> json) {
    return Achievement.fromJson(json);
  }
}

/// @nodoc
const $Achievement = _$AchievementTearOff();

/// @nodoc
mixin _$Achievement {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;
  int get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
          Achievement value, $Res Function(Achievement) then) =
      _$AchievementCopyWithImpl<$Res>;
  $Res call({String id, String name, String description, int exp, int icon});
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res> implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  final Achievement _value;
  // ignore: unused_field
  final $Res Function(Achievement) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? exp = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      exp: exp == freezed
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AchievementCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$AchievementCopyWith(
          _Achievement value, $Res Function(_Achievement) then) =
      __$AchievementCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String description, int exp, int icon});
}

/// @nodoc
class __$AchievementCopyWithImpl<$Res> extends _$AchievementCopyWithImpl<$Res>
    implements _$AchievementCopyWith<$Res> {
  __$AchievementCopyWithImpl(
      _Achievement _value, $Res Function(_Achievement) _then)
      : super(_value, (v) => _then(v as _Achievement));

  @override
  _Achievement get _value => super._value as _Achievement;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? exp = freezed,
    Object? icon = freezed,
  }) {
    return _then(_Achievement(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      exp: exp == freezed
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Achievement with DiagnosticableTreeMixin implements _Achievement {
  const _$_Achievement(
      {required this.id,
      required this.name,
      required this.description,
      required this.exp,
      required this.icon});

  factory _$_Achievement.fromJson(Map<String, dynamic> json) =>
      _$_$_AchievementFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int exp;
  @override
  final int icon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Achievement(id: $id, name: $name, description: $description, exp: $exp, icon: $icon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Achievement'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('exp', exp))
      ..add(DiagnosticsProperty('icon', icon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Achievement &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.exp, exp) ||
                const DeepCollectionEquality().equals(other.exp, exp)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(exp) ^
      const DeepCollectionEquality().hash(icon);

  @JsonKey(ignore: true)
  @override
  _$AchievementCopyWith<_Achievement> get copyWith =>
      __$AchievementCopyWithImpl<_Achievement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AchievementToJson(this);
  }
}

abstract class _Achievement implements Achievement {
  const factory _Achievement(
      {required String id,
      required String name,
      required String description,
      required int exp,
      required int icon}) = _$_Achievement;

  factory _Achievement.fromJson(Map<String, dynamic> json) =
      _$_Achievement.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  int get exp => throw _privateConstructorUsedError;
  @override
  int get icon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AchievementCopyWith<_Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
class _$RouteTearOff {
  const _$RouteTearOff();

  _Route call(
      {required String id,
      required String name,
      required String description,
      required int duration,
      required int exp,
      List<Step>? steps,
      required List<String> tags,
      List<Comment>? comments}) {
    return _Route(
      id: id,
      name: name,
      description: description,
      duration: duration,
      exp: exp,
      steps: steps,
      tags: tags,
      comments: comments,
    );
  }

  Route fromJson(Map<String, Object> json) {
    return Route.fromJson(json);
  }
}

/// @nodoc
const $Route = _$RouteTearOff();

/// @nodoc
mixin _$Route {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;
  List<Step>? get steps => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<Comment>? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteCopyWith<Route> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCopyWith<$Res> {
  factory $RouteCopyWith(Route value, $Res Function(Route) then) =
      _$RouteCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String description,
      int duration,
      int exp,
      List<Step>? steps,
      List<String> tags,
      List<Comment>? comments});
}

/// @nodoc
class _$RouteCopyWithImpl<$Res> implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._value, this._then);

  final Route _value;
  // ignore: unused_field
  final $Res Function(Route) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? exp = freezed,
    Object? steps = freezed,
    Object? tags = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      exp: exp == freezed
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
    ));
  }
}

/// @nodoc
abstract class _$RouteCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$RouteCopyWith(_Route value, $Res Function(_Route) then) =
      __$RouteCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String description,
      int duration,
      int exp,
      List<Step>? steps,
      List<String> tags,
      List<Comment>? comments});
}

/// @nodoc
class __$RouteCopyWithImpl<$Res> extends _$RouteCopyWithImpl<$Res>
    implements _$RouteCopyWith<$Res> {
  __$RouteCopyWithImpl(_Route _value, $Res Function(_Route) _then)
      : super(_value, (v) => _then(v as _Route));

  @override
  _Route get _value => super._value as _Route;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? exp = freezed,
    Object? steps = freezed,
    Object? tags = freezed,
    Object? comments = freezed,
  }) {
    return _then(_Route(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      exp: exp == freezed
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Route with DiagnosticableTreeMixin implements _Route {
  const _$_Route(
      {required this.id,
      required this.name,
      required this.description,
      required this.duration,
      required this.exp,
      this.steps,
      required this.tags,
      this.comments});

  factory _$_Route.fromJson(Map<String, dynamic> json) =>
      _$_$_RouteFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int duration;
  @override
  final int exp;
  @override
  final List<Step>? steps;
  @override
  final List<String> tags;
  @override
  final List<Comment>? comments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Route(id: $id, name: $name, description: $description, duration: $duration, exp: $exp, steps: $steps, tags: $tags, comments: $comments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Route'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('exp', exp))
      ..add(DiagnosticsProperty('steps', steps))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('comments', comments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Route &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.exp, exp) ||
                const DeepCollectionEquality().equals(other.exp, exp)) &&
            (identical(other.steps, steps) ||
                const DeepCollectionEquality().equals(other.steps, steps)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(exp) ^
      const DeepCollectionEquality().hash(steps) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(comments);

  @JsonKey(ignore: true)
  @override
  _$RouteCopyWith<_Route> get copyWith =>
      __$RouteCopyWithImpl<_Route>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RouteToJson(this);
  }
}

abstract class _Route implements Route {
  const factory _Route(
      {required String id,
      required String name,
      required String description,
      required int duration,
      required int exp,
      List<Step>? steps,
      required List<String> tags,
      List<Comment>? comments}) = _$_Route;

  factory _Route.fromJson(Map<String, dynamic> json) = _$_Route.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  int get duration => throw _privateConstructorUsedError;
  @override
  int get exp => throw _privateConstructorUsedError;
  @override
  List<Step>? get steps => throw _privateConstructorUsedError;
  @override
  List<String> get tags => throw _privateConstructorUsedError;
  @override
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RouteCopyWith<_Route> get copyWith => throw _privateConstructorUsedError;
}

Step _$StepFromJson(Map<String, dynamic> json) {
  return _Step.fromJson(json);
}

/// @nodoc
class _$StepTearOff {
  const _$StepTearOff();

  _Step call(
      {required String name,
      required String description,
      Point? point,
      @JsonKey(name: 'photoURL') String? photoUrl}) {
    return _Step(
      name: name,
      description: description,
      point: point,
      photoUrl: photoUrl,
    );
  }

  Step fromJson(Map<String, Object> json) {
    return Step.fromJson(json);
  }
}

/// @nodoc
const $Step = _$StepTearOff();

/// @nodoc
mixin _$Step {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Point? get point => throw _privateConstructorUsedError;
  @JsonKey(name: 'photoURL')
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepCopyWith<Step> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCopyWith<$Res> {
  factory $StepCopyWith(Step value, $Res Function(Step) then) =
      _$StepCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String description,
      Point? point,
      @JsonKey(name: 'photoURL') String? photoUrl});

  $PointCopyWith<$Res>? get point;
}

/// @nodoc
class _$StepCopyWithImpl<$Res> implements $StepCopyWith<$Res> {
  _$StepCopyWithImpl(this._value, this._then);

  final Step _value;
  // ignore: unused_field
  final $Res Function(Step) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? point = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PointCopyWith<$Res>? get point {
    if (_value.point == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_value.point!, (value) {
      return _then(_value.copyWith(point: value));
    });
  }
}

/// @nodoc
abstract class _$StepCopyWith<$Res> implements $StepCopyWith<$Res> {
  factory _$StepCopyWith(_Step value, $Res Function(_Step) then) =
      __$StepCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String description,
      Point? point,
      @JsonKey(name: 'photoURL') String? photoUrl});

  @override
  $PointCopyWith<$Res>? get point;
}

/// @nodoc
class __$StepCopyWithImpl<$Res> extends _$StepCopyWithImpl<$Res>
    implements _$StepCopyWith<$Res> {
  __$StepCopyWithImpl(_Step _value, $Res Function(_Step) _then)
      : super(_value, (v) => _then(v as _Step));

  @override
  _Step get _value => super._value as _Step;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? point = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_Step(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Step with DiagnosticableTreeMixin implements _Step {
  const _$_Step(
      {required this.name,
      required this.description,
      this.point,
      @JsonKey(name: 'photoURL') this.photoUrl});

  factory _$_Step.fromJson(Map<String, dynamic> json) =>
      _$_$_StepFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final Point? point;
  @override
  @JsonKey(name: 'photoURL')
  final String? photoUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Step(name: $name, description: $description, point: $point, photoUrl: $photoUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Step'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('point', point))
      ..add(DiagnosticsProperty('photoUrl', photoUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Step &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(point) ^
      const DeepCollectionEquality().hash(photoUrl);

  @JsonKey(ignore: true)
  @override
  _$StepCopyWith<_Step> get copyWith =>
      __$StepCopyWithImpl<_Step>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StepToJson(this);
  }
}

abstract class _Step implements Step {
  const factory _Step(
      {required String name,
      required String description,
      Point? point,
      @JsonKey(name: 'photoURL') String? photoUrl}) = _$_Step;

  factory _Step.fromJson(Map<String, dynamic> json) = _$_Step.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  Point? get point => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'photoURL')
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StepCopyWith<_Step> get copyWith => throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
class _$CommentTearOff {
  const _$CommentTearOff();

  _Comment call(
      {required String id,
      required String text,
      required String authorId,
      required DateTime date,
      required int likes}) {
    return _Comment(
      id: id,
      text: text,
      authorId: authorId,
      date: date,
      likes: likes,
    );
  }

  Comment fromJson(Map<String, Object> json) {
    return Comment.fromJson(json);
  }
}

/// @nodoc
const $Comment = _$CommentTearOff();

/// @nodoc
mixin _$Comment {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {String id, String text, String authorId, DateTime date, int likes});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? authorId = freezed,
    Object? date = freezed,
    Object? likes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) then) =
      __$CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String text, String authorId, DateTime date, int likes});
}

/// @nodoc
class __$CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(_Comment _value, $Res Function(_Comment) _then)
      : super(_value, (v) => _then(v as _Comment));

  @override
  _Comment get _value => super._value as _Comment;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? authorId = freezed,
    Object? date = freezed,
    Object? likes = freezed,
  }) {
    return _then(_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment with DiagnosticableTreeMixin implements _Comment {
  const _$_Comment(
      {required this.id,
      required this.text,
      required this.authorId,
      required this.date,
      required this.likes});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$_$_CommentFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String authorId;
  @override
  final DateTime date;
  @override
  final int likes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Comment(id: $id, text: $text, authorId: $authorId, date: $date, likes: $likes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Comment'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('authorId', authorId))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('likes', likes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Comment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.authorId, authorId) ||
                const DeepCollectionEquality()
                    .equals(other.authorId, authorId)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(authorId) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(likes);

  @JsonKey(ignore: true)
  @override
  _$CommentCopyWith<_Comment> get copyWith =>
      __$CommentCopyWithImpl<_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CommentToJson(this);
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required String id,
      required String text,
      required String authorId,
      required DateTime date,
      required int likes}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  String get authorId => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  int get likes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommentCopyWith<_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}

Coordinate _$CoordinateFromJson(Map<String, dynamic> json) {
  return _Coordinate.fromJson(json);
}

/// @nodoc
class _$CoordinateTearOff {
  const _$CoordinateTearOff();

  _Coordinate call({required double lat, required double lng}) {
    return _Coordinate(
      lat: lat,
      lng: lng,
    );
  }

  Coordinate fromJson(Map<String, Object> json) {
    return Coordinate.fromJson(json);
  }
}

/// @nodoc
const $Coordinate = _$CoordinateTearOff();

/// @nodoc
mixin _$Coordinate {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordinateCopyWith<Coordinate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinateCopyWith<$Res> {
  factory $CoordinateCopyWith(
          Coordinate value, $Res Function(Coordinate) then) =
      _$CoordinateCopyWithImpl<$Res>;
  $Res call({double lat, double lng});
}

/// @nodoc
class _$CoordinateCopyWithImpl<$Res> implements $CoordinateCopyWith<$Res> {
  _$CoordinateCopyWithImpl(this._value, this._then);

  final Coordinate _value;
  // ignore: unused_field
  final $Res Function(Coordinate) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$CoordinateCopyWith<$Res> implements $CoordinateCopyWith<$Res> {
  factory _$CoordinateCopyWith(
          _Coordinate value, $Res Function(_Coordinate) then) =
      __$CoordinateCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng});
}

/// @nodoc
class __$CoordinateCopyWithImpl<$Res> extends _$CoordinateCopyWithImpl<$Res>
    implements _$CoordinateCopyWith<$Res> {
  __$CoordinateCopyWithImpl(
      _Coordinate _value, $Res Function(_Coordinate) _then)
      : super(_value, (v) => _then(v as _Coordinate));

  @override
  _Coordinate get _value => super._value as _Coordinate;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_Coordinate(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coordinate with DiagnosticableTreeMixin implements _Coordinate {
  const _$_Coordinate({required this.lat, required this.lng});

  factory _$_Coordinate.fromJson(Map<String, dynamic> json) =>
      _$_$_CoordinateFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Coordinate(lat: $lat, lng: $lng)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Coordinate'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lng', lng));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Coordinate &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lng, lng) ||
                const DeepCollectionEquality().equals(other.lng, lng)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lng);

  @JsonKey(ignore: true)
  @override
  _$CoordinateCopyWith<_Coordinate> get copyWith =>
      __$CoordinateCopyWithImpl<_Coordinate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CoordinateToJson(this);
  }
}

abstract class _Coordinate implements Coordinate {
  const factory _Coordinate({required double lat, required double lng}) =
      _$_Coordinate;

  factory _Coordinate.fromJson(Map<String, dynamic> json) =
      _$_Coordinate.fromJson;

  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  double get lng => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CoordinateCopyWith<_Coordinate> get copyWith =>
      throw _privateConstructorUsedError;
}

Point _$PointFromJson(Map<String, dynamic> json) {
  return _Point.fromJson(json);
}

/// @nodoc
class _$PointTearOff {
  const _$PointTearOff();

  _Point call(
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
      required int likes}) {
    return _Point(
      id: id,
      authorId: authorId,
      name: name,
      photoUrl: photoUrl,
      howToGet: howToGet,
      type: type,
      tags: tags,
      coordinates: coordinates,
      description: description,
      website: website,
      comments: comments,
      likes: likes,
    );
  }

  Point fromJson(Map<String, Object> json) {
    return Point.fromJson(json);
  }
}

/// @nodoc
const $Point = _$PointTearOff();

/// @nodoc
mixin _$Point {
  String? get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'photoURL')
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get howToGet => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  Coordinate get coordinates => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  List<Comment>? get comments => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String authorId,
      String name,
      @JsonKey(name: 'photoURL') String? photoUrl,
      String? howToGet,
      String type,
      List<String>? tags,
      Coordinate coordinates,
      String? description,
      String? website,
      List<Comment>? comments,
      int likes});

  $CoordinateCopyWith<$Res> get coordinates;
}

/// @nodoc
class _$PointCopyWithImpl<$Res> implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  final Point _value;
  // ignore: unused_field
  final $Res Function(Point) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? howToGet = freezed,
    Object? type = freezed,
    Object? tags = freezed,
    Object? coordinates = freezed,
    Object? description = freezed,
    Object? website = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      howToGet: howToGet == freezed
          ? _value.howToGet
          : howToGet // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $CoordinateCopyWith<$Res> get coordinates {
    return $CoordinateCopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value));
    });
  }
}

/// @nodoc
abstract class _$PointCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$PointCopyWith(_Point value, $Res Function(_Point) then) =
      __$PointCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String authorId,
      String name,
      @JsonKey(name: 'photoURL') String? photoUrl,
      String? howToGet,
      String type,
      List<String>? tags,
      Coordinate coordinates,
      String? description,
      String? website,
      List<Comment>? comments,
      int likes});

  @override
  $CoordinateCopyWith<$Res> get coordinates;
}

/// @nodoc
class __$PointCopyWithImpl<$Res> extends _$PointCopyWithImpl<$Res>
    implements _$PointCopyWith<$Res> {
  __$PointCopyWithImpl(_Point _value, $Res Function(_Point) _then)
      : super(_value, (v) => _then(v as _Point));

  @override
  _Point get _value => super._value as _Point;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? howToGet = freezed,
    Object? type = freezed,
    Object? tags = freezed,
    Object? coordinates = freezed,
    Object? description = freezed,
    Object? website = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
  }) {
    return _then(_Point(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      howToGet: howToGet == freezed
          ? _value.howToGet
          : howToGet // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Point with DiagnosticableTreeMixin implements _Point {
  const _$_Point(
      {this.id,
      required this.authorId,
      required this.name,
      @JsonKey(name: 'photoURL') this.photoUrl,
      this.howToGet,
      required this.type,
      this.tags,
      required this.coordinates,
      this.description,
      this.website,
      this.comments,
      required this.likes});

  factory _$_Point.fromJson(Map<String, dynamic> json) =>
      _$_$_PointFromJson(json);

  @override
  final String? id;
  @override
  final String authorId;
  @override
  final String name;
  @override
  @JsonKey(name: 'photoURL')
  final String? photoUrl;
  @override
  final String? howToGet;
  @override
  final String type;
  @override
  final List<String>? tags;
  @override
  final Coordinate coordinates;
  @override
  final String? description;
  @override
  final String? website;
  @override
  final List<Comment>? comments;
  @override
  final int likes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Point(id: $id, authorId: $authorId, name: $name, photoUrl: $photoUrl, howToGet: $howToGet, type: $type, tags: $tags, coordinates: $coordinates, description: $description, website: $website, comments: $comments, likes: $likes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Point'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('authorId', authorId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('howToGet', howToGet))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('coordinates', coordinates))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('website', website))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('likes', likes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Point &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.authorId, authorId) ||
                const DeepCollectionEquality()
                    .equals(other.authorId, authorId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.howToGet, howToGet) ||
                const DeepCollectionEquality()
                    .equals(other.howToGet, howToGet)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.coordinates, coordinates) ||
                const DeepCollectionEquality()
                    .equals(other.coordinates, coordinates)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(authorId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(howToGet) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(coordinates) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(likes);

  @JsonKey(ignore: true)
  @override
  _$PointCopyWith<_Point> get copyWith =>
      __$PointCopyWithImpl<_Point>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PointToJson(this);
  }
}

abstract class _Point implements Point {
  const factory _Point(
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
      required int likes}) = _$_Point;

  factory _Point.fromJson(Map<String, dynamic> json) = _$_Point.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get authorId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'photoURL')
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  String? get howToGet => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  List<String>? get tags => throw _privateConstructorUsedError;
  @override
  Coordinate get coordinates => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get website => throw _privateConstructorUsedError;
  @override
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @override
  int get likes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PointCopyWith<_Point> get copyWith => throw _privateConstructorUsedError;
}

LocalPoint _$LocalPointFromJson(Map<String, dynamic> json) {
  return _LocalPoint.fromJson(json);
}

/// @nodoc
class _$LocalPointTearOff {
  const _$LocalPointTearOff();

  _LocalPoint call(
      {String? name,
      @JsonKey(ignore: true) SendingAttachment? file,
      String? type,
      required List<String> tags,
      required Coordinate coordinate,
      String? description,
      String? website}) {
    return _LocalPoint(
      name: name,
      file: file,
      type: type,
      tags: tags,
      coordinate: coordinate,
      description: description,
      website: website,
    );
  }

  LocalPoint fromJson(Map<String, Object> json) {
    return LocalPoint.fromJson(json);
  }
}

/// @nodoc
const $LocalPoint = _$LocalPointTearOff();

/// @nodoc
mixin _$LocalPoint {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  SendingAttachment? get file => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  Coordinate get coordinate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalPointCopyWith<LocalPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalPointCopyWith<$Res> {
  factory $LocalPointCopyWith(
          LocalPoint value, $Res Function(LocalPoint) then) =
      _$LocalPointCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      @JsonKey(ignore: true) SendingAttachment? file,
      String? type,
      List<String> tags,
      Coordinate coordinate,
      String? description,
      String? website});

  $CoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$LocalPointCopyWithImpl<$Res> implements $LocalPointCopyWith<$Res> {
  _$LocalPointCopyWithImpl(this._value, this._then);

  final LocalPoint _value;
  // ignore: unused_field
  final $Res Function(LocalPoint) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? file = freezed,
    Object? type = freezed,
    Object? tags = freezed,
    Object? coordinate = freezed,
    Object? description = freezed,
    Object? website = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as SendingAttachment?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coordinate: coordinate == freezed
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $CoordinateCopyWith<$Res> get coordinate {
    return $CoordinateCopyWith<$Res>(_value.coordinate, (value) {
      return _then(_value.copyWith(coordinate: value));
    });
  }
}

/// @nodoc
abstract class _$LocalPointCopyWith<$Res> implements $LocalPointCopyWith<$Res> {
  factory _$LocalPointCopyWith(
          _LocalPoint value, $Res Function(_LocalPoint) then) =
      __$LocalPointCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      @JsonKey(ignore: true) SendingAttachment? file,
      String? type,
      List<String> tags,
      Coordinate coordinate,
      String? description,
      String? website});

  @override
  $CoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$LocalPointCopyWithImpl<$Res> extends _$LocalPointCopyWithImpl<$Res>
    implements _$LocalPointCopyWith<$Res> {
  __$LocalPointCopyWithImpl(
      _LocalPoint _value, $Res Function(_LocalPoint) _then)
      : super(_value, (v) => _then(v as _LocalPoint));

  @override
  _LocalPoint get _value => super._value as _LocalPoint;

  @override
  $Res call({
    Object? name = freezed,
    Object? file = freezed,
    Object? type = freezed,
    Object? tags = freezed,
    Object? coordinate = freezed,
    Object? description = freezed,
    Object? website = freezed,
  }) {
    return _then(_LocalPoint(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as SendingAttachment?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coordinate: coordinate == freezed
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalPoint with DiagnosticableTreeMixin implements _LocalPoint {
  const _$_LocalPoint(
      {this.name,
      @JsonKey(ignore: true) this.file,
      this.type,
      required this.tags,
      required this.coordinate,
      this.description,
      this.website});

  factory _$_LocalPoint.fromJson(Map<String, dynamic> json) =>
      _$_$_LocalPointFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(ignore: true)
  final SendingAttachment? file;
  @override
  final String? type;
  @override
  final List<String> tags;
  @override
  final Coordinate coordinate;
  @override
  final String? description;
  @override
  final String? website;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalPoint(name: $name, file: $file, type: $type, tags: $tags, coordinate: $coordinate, description: $description, website: $website)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalPoint'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('coordinate', coordinate))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('website', website));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalPoint &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.coordinate, coordinate) ||
                const DeepCollectionEquality()
                    .equals(other.coordinate, coordinate)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality().equals(other.website, website)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(file) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(coordinate) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(website);

  @JsonKey(ignore: true)
  @override
  _$LocalPointCopyWith<_LocalPoint> get copyWith =>
      __$LocalPointCopyWithImpl<_LocalPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocalPointToJson(this);
  }
}

abstract class _LocalPoint implements LocalPoint {
  const factory _LocalPoint(
      {String? name,
      @JsonKey(ignore: true) SendingAttachment? file,
      String? type,
      required List<String> tags,
      required Coordinate coordinate,
      String? description,
      String? website}) = _$_LocalPoint;

  factory _LocalPoint.fromJson(Map<String, dynamic> json) =
      _$_LocalPoint.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  SendingAttachment? get file => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  List<String> get tags => throw _privateConstructorUsedError;
  @override
  Coordinate get coordinate => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get website => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocalPointCopyWith<_LocalPoint> get copyWith =>
      throw _privateConstructorUsedError;
}
