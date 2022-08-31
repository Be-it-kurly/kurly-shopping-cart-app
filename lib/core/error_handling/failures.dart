import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._(); // This constructor is needed to have custom methods in Freezed.
  const factory Failure.serverFailure() = ServerFailure;
  const factory Failure.dataParsingFailure() = DataParsingFailure;
  const factory Failure.noConnectionFailure() = NoConnectionFailure;
  const factory Failure.unauthorizedFailure() = UnauthorizedFailure;
  const factory Failure.notFoundFailure() = NotFoundFailure;
  const factory Failure.noUserDataFailure() = NoUserDataFailure;
  const factory Failure.getStorageDataFailure() = GetStorageDataFailure;
  const factory Failure.saveStorageDataFailure() = SaveStorageDataFailure;
  const factory Failure.undefinedFailure() = UndefinedFailure;
  const factory Failure.dioOtherFailure() = DioOtherFailure;
  const factory Failure.jwtTokenIssuingFailure() = JwtTokenIssuingFailure;
  const factory Failure.jwtTokenRefreshFailure() = JwtTokenRefreshFailure;
}
