// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KurlyUser _$KurlyUserFromJson(Map<String, dynamic> json) {
  return _KurlyUser.fromJson(json);
}

/// @nodoc
mixin _$KurlyUser {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  int get totalServiceCount => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KurlyUserCopyWith<KurlyUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KurlyUserCopyWith<$Res> {
  factory $KurlyUserCopyWith(KurlyUser value, $Res Function(KurlyUser) then) =
      _$KurlyUserCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String userName,
      int age,
      int totalServiceCount,
      String? photoURL});
}

/// @nodoc
class _$KurlyUserCopyWithImpl<$Res> implements $KurlyUserCopyWith<$Res> {
  _$KurlyUserCopyWithImpl(this._value, this._then);

  final KurlyUser _value;
  // ignore: unused_field
  final $Res Function(KurlyUser) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? age = freezed,
    Object? totalServiceCount = freezed,
    Object? photoURL = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      totalServiceCount: totalServiceCount == freezed
          ? _value.totalServiceCount
          : totalServiceCount // ignore: cast_nullable_to_non_nullable
              as int,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_KurlyUserCopyWith<$Res> implements $KurlyUserCopyWith<$Res> {
  factory _$$_KurlyUserCopyWith(
          _$_KurlyUser value, $Res Function(_$_KurlyUser) then) =
      __$$_KurlyUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String userName,
      int age,
      int totalServiceCount,
      String? photoURL});
}

/// @nodoc
class __$$_KurlyUserCopyWithImpl<$Res> extends _$KurlyUserCopyWithImpl<$Res>
    implements _$$_KurlyUserCopyWith<$Res> {
  __$$_KurlyUserCopyWithImpl(
      _$_KurlyUser _value, $Res Function(_$_KurlyUser) _then)
      : super(_value, (v) => _then(v as _$_KurlyUser));

  @override
  _$_KurlyUser get _value => super._value as _$_KurlyUser;

  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? age = freezed,
    Object? totalServiceCount = freezed,
    Object? photoURL = freezed,
  }) {
    return _then(_$_KurlyUser(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      totalServiceCount: totalServiceCount == freezed
          ? _value.totalServiceCount
          : totalServiceCount // ignore: cast_nullable_to_non_nullable
              as int,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_KurlyUser implements _KurlyUser {
  _$_KurlyUser(
      {required this.userId,
      required this.userName,
      required this.age,
      required this.totalServiceCount,
      this.photoURL});

  factory _$_KurlyUser.fromJson(Map<String, dynamic> json) =>
      _$$_KurlyUserFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final int age;
  @override
  final int totalServiceCount;
  @override
  final String? photoURL;

  @override
  String toString() {
    return 'KurlyUser(userId: $userId, userName: $userName, age: $age, totalServiceCount: $totalServiceCount, photoURL: $photoURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KurlyUser &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality()
                .equals(other.totalServiceCount, totalServiceCount) &&
            const DeepCollectionEquality().equals(other.photoURL, photoURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(totalServiceCount),
      const DeepCollectionEquality().hash(photoURL));

  @JsonKey(ignore: true)
  @override
  _$$_KurlyUserCopyWith<_$_KurlyUser> get copyWith =>
      __$$_KurlyUserCopyWithImpl<_$_KurlyUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KurlyUserToJson(
      this,
    );
  }
}

abstract class _KurlyUser implements KurlyUser {
  factory _KurlyUser(
      {required final String userId,
      required final String userName,
      required final int age,
      required final int totalServiceCount,
      final String? photoURL}) = _$_KurlyUser;

  factory _KurlyUser.fromJson(Map<String, dynamic> json) =
      _$_KurlyUser.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  int get age;
  @override
  int get totalServiceCount;
  @override
  String? get photoURL;
  @override
  @JsonKey(ignore: true)
  _$$_KurlyUserCopyWith<_$_KurlyUser> get copyWith =>
      throw _privateConstructorUsedError;
}
