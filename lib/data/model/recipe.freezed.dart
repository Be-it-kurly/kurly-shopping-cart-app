// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  int get totalPrice => throw _privateConstructorUsedError;
  String get recipeName => throw _privateConstructorUsedError;
  String get mealTime => throw _privateConstructorUsedError;
  String get receiptId => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get step => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  int get headcount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res>;
  $Res call(
      {int totalPrice,
      String recipeName,
      String mealTime,
      String receiptId,
      String difficulty,
      String thumbnail,
      String step,
      int time,
      int headcount});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res> implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  final Recipe _value;
  // ignore: unused_field
  final $Res Function(Recipe) _then;

  @override
  $Res call({
    Object? totalPrice = freezed,
    Object? recipeName = freezed,
    Object? mealTime = freezed,
    Object? receiptId = freezed,
    Object? difficulty = freezed,
    Object? thumbnail = freezed,
    Object? step = freezed,
    Object? time = freezed,
    Object? headcount = freezed,
  }) {
    return _then(_value.copyWith(
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      recipeName: recipeName == freezed
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String,
      mealTime: mealTime == freezed
          ? _value.mealTime
          : mealTime // ignore: cast_nullable_to_non_nullable
              as String,
      receiptId: receiptId == freezed
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      headcount: headcount == freezed
          ? _value.headcount
          : headcount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$_RecipeCopyWith(_$_Recipe value, $Res Function(_$_Recipe) then) =
      __$$_RecipeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalPrice,
      String recipeName,
      String mealTime,
      String receiptId,
      String difficulty,
      String thumbnail,
      String step,
      int time,
      int headcount});
}

/// @nodoc
class __$$_RecipeCopyWithImpl<$Res> extends _$RecipeCopyWithImpl<$Res>
    implements _$$_RecipeCopyWith<$Res> {
  __$$_RecipeCopyWithImpl(_$_Recipe _value, $Res Function(_$_Recipe) _then)
      : super(_value, (v) => _then(v as _$_Recipe));

  @override
  _$_Recipe get _value => super._value as _$_Recipe;

  @override
  $Res call({
    Object? totalPrice = freezed,
    Object? recipeName = freezed,
    Object? mealTime = freezed,
    Object? receiptId = freezed,
    Object? difficulty = freezed,
    Object? thumbnail = freezed,
    Object? step = freezed,
    Object? time = freezed,
    Object? headcount = freezed,
  }) {
    return _then(_$_Recipe(
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      recipeName: recipeName == freezed
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String,
      mealTime: mealTime == freezed
          ? _value.mealTime
          : mealTime // ignore: cast_nullable_to_non_nullable
              as String,
      receiptId: receiptId == freezed
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      headcount: headcount == freezed
          ? _value.headcount
          : headcount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Recipe implements _Recipe {
  _$_Recipe(
      {required this.totalPrice,
      required this.recipeName,
      required this.mealTime,
      required this.receiptId,
      required this.difficulty,
      required this.thumbnail,
      required this.step,
      required this.time,
      required this.headcount});

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  final int totalPrice;
  @override
  final String recipeName;
  @override
  final String mealTime;
  @override
  final String receiptId;
  @override
  final String difficulty;
  @override
  final String thumbnail;
  @override
  final String step;
  @override
  final int time;
  @override
  final int headcount;

  @override
  String toString() {
    return 'Recipe(totalPrice: $totalPrice, recipeName: $recipeName, mealTime: $mealTime, receiptId: $receiptId, difficulty: $difficulty, thumbnail: $thumbnail, step: $step, time: $time, headcount: $headcount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recipe &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice) &&
            const DeepCollectionEquality()
                .equals(other.recipeName, recipeName) &&
            const DeepCollectionEquality().equals(other.mealTime, mealTime) &&
            const DeepCollectionEquality().equals(other.receiptId, receiptId) &&
            const DeepCollectionEquality()
                .equals(other.difficulty, difficulty) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.step, step) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.headcount, headcount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalPrice),
      const DeepCollectionEquality().hash(recipeName),
      const DeepCollectionEquality().hash(mealTime),
      const DeepCollectionEquality().hash(receiptId),
      const DeepCollectionEquality().hash(difficulty),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(step),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(headcount));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      __$$_RecipeCopyWithImpl<_$_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  factory _Recipe(
      {required final int totalPrice,
      required final String recipeName,
      required final String mealTime,
      required final String receiptId,
      required final String difficulty,
      required final String thumbnail,
      required final String step,
      required final int time,
      required final int headcount}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  int get totalPrice;
  @override
  String get recipeName;
  @override
  String get mealTime;
  @override
  String get receiptId;
  @override
  String get difficulty;
  @override
  String get thumbnail;
  @override
  String get step;
  @override
  int get time;
  @override
  int get headcount;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      throw _privateConstructorUsedError;
}
