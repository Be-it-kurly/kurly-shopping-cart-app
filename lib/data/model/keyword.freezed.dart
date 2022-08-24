// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'keyword.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Keyword _$KeywordFromJson(Map<String, dynamic> json) {
  return _Keyword.fromJson(json);
}

/// @nodoc
mixin _$Keyword {
  String get text => throw _privateConstructorUsedError;
  KeywordType get keywordType => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeywordCopyWith<Keyword> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeywordCopyWith<$Res> {
  factory $KeywordCopyWith(Keyword value, $Res Function(Keyword) then) =
      _$KeywordCopyWithImpl<$Res>;
  $Res call({String text, KeywordType keywordType, int weight});
}

/// @nodoc
class _$KeywordCopyWithImpl<$Res> implements $KeywordCopyWith<$Res> {
  _$KeywordCopyWithImpl(this._value, this._then);

  final Keyword _value;
  // ignore: unused_field
  final $Res Function(Keyword) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? keywordType = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      keywordType: keywordType == freezed
          ? _value.keywordType
          : keywordType // ignore: cast_nullable_to_non_nullable
              as KeywordType,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_KeywordCopyWith<$Res> implements $KeywordCopyWith<$Res> {
  factory _$$_KeywordCopyWith(
          _$_Keyword value, $Res Function(_$_Keyword) then) =
      __$$_KeywordCopyWithImpl<$Res>;
  @override
  $Res call({String text, KeywordType keywordType, int weight});
}

/// @nodoc
class __$$_KeywordCopyWithImpl<$Res> extends _$KeywordCopyWithImpl<$Res>
    implements _$$_KeywordCopyWith<$Res> {
  __$$_KeywordCopyWithImpl(_$_Keyword _value, $Res Function(_$_Keyword) _then)
      : super(_value, (v) => _then(v as _$_Keyword));

  @override
  _$_Keyword get _value => super._value as _$_Keyword;

  @override
  $Res call({
    Object? text = freezed,
    Object? keywordType = freezed,
    Object? weight = freezed,
  }) {
    return _then(_$_Keyword(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      keywordType: keywordType == freezed
          ? _value.keywordType
          : keywordType // ignore: cast_nullable_to_non_nullable
              as KeywordType,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Keyword implements _Keyword {
  _$_Keyword(
      {required this.text, required this.keywordType, required this.weight});

  factory _$_Keyword.fromJson(Map<String, dynamic> json) =>
      _$$_KeywordFromJson(json);

  @override
  final String text;
  @override
  final KeywordType keywordType;
  @override
  final int weight;

  @override
  String toString() {
    return 'Keyword(text: $text, keywordType: $keywordType, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Keyword &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality()
                .equals(other.keywordType, keywordType) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(keywordType),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$$_KeywordCopyWith<_$_Keyword> get copyWith =>
      __$$_KeywordCopyWithImpl<_$_Keyword>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeywordToJson(
      this,
    );
  }
}

abstract class _Keyword implements Keyword {
  factory _Keyword(
      {required final String text,
      required final KeywordType keywordType,
      required final int weight}) = _$_Keyword;

  factory _Keyword.fromJson(Map<String, dynamic> json) = _$_Keyword.fromJson;

  @override
  String get text;
  @override
  KeywordType get keywordType;
  @override
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$$_KeywordCopyWith<_$_Keyword> get copyWith =>
      throw _privateConstructorUsedError;
}
