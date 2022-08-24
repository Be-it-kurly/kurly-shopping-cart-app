import 'package:freezed_annotation/freezed_annotation.dart';
import '../../configs/constants/enum.dart';
part 'keyword.freezed.dart';
part 'keyword.g.dart';

@freezed
class Keyword with _$Keyword {
  @JsonSerializable(explicitToJson: true)
  factory Keyword({
    required String text,
    required KeywordType keywordType,
    required int weight,
  }) = _Keyword;

  factory Keyword.fromJson(Map<String, dynamic> json) =>
      _$KeywordFromJson(json);
}
