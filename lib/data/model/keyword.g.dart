// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Keyword _$$_KeywordFromJson(Map<String, dynamic> json) => _$_Keyword(
      text: json['text'] as String,
      keywordType: $enumDecode(_$KeywordTypeEnumMap, json['keywordType']),
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$$_KeywordToJson(_$_Keyword instance) =>
    <String, dynamic>{
      'text': instance.text,
      'keywordType': _$KeywordTypeEnumMap[instance.keywordType]!,
      'weight': instance.weight,
    };

const _$KeywordTypeEnumMap = {
  KeywordType.taste: 'taste',
  KeywordType.cusine: 'cusine',
  KeywordType.foodType: 'foodType',
};
