// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KurlyUser _$$_KurlyUserFromJson(Map<String, dynamic> json) => _$_KurlyUser(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      age: json['age'] as int,
      totalServiceCount: json['totalServiceCount'] as int,
      photoURL: json['photoURL'] as String?,
    );

Map<String, dynamic> _$$_KurlyUserToJson(_$_KurlyUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'age': instance.age,
      'totalServiceCount': instance.totalServiceCount,
      'photoURL': instance.photoURL,
    };
