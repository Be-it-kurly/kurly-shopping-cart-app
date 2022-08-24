// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      totalPrice: json['totalPrice'] as int,
      recipeName: json['recipeName'] as String,
      mealTime: json['mealTime'] as String,
      receiptId: json['receiptId'] as String,
      difficulty: json['difficulty'] as String,
      thumbnail: json['thumbnail'] as String,
      step: json['step'] as String,
      time: json['time'] as int,
      headcount: json['headcount'] as int,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'totalPrice': instance.totalPrice,
      'recipeName': instance.recipeName,
      'mealTime': instance.mealTime,
      'receiptId': instance.receiptId,
      'difficulty': instance.difficulty,
      'thumbnail': instance.thumbnail,
      'step': instance.step,
      'time': instance.time,
      'headcount': instance.headcount,
    };
