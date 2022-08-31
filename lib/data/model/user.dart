import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class KurlyUser with _$KurlyUser {
  @JsonSerializable(explicitToJson: true)
  factory KurlyUser({
    required String userId,
    required String userName,
    required int age,
    required int totalServiceCount,
    String? photoURL,
  }) = _KurlyUser;

  factory KurlyUser.fromJson(Map<String, dynamic> json) =>
      _$KurlyUserFromJson(json);
}
