import 'package:equatable/equatable.dart';
import 'failures.dart';

class ErrorMessage extends Equatable {
  const ErrorMessage({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object?> get props => [title, message];

  static ErrorMessage mapFailureToErrorMessage({required Failure failure}) {
    return failure.when(
      serverFailure: () => const ErrorMessage(
        title: 'api 서버 에러',
        message: '정보를 불러올 수 없어요',
      ),
      dataParsingFailure: () => const ErrorMessage(
        title: '데이터 파싱 에러',
        message: '해당 정보를 불러올 수 없어요',
      ),
      dioOtherFailure: () => const ErrorMessage(
        title: '다른 dio exception 문제로 실패',
        message: '해당 정보를 불러올 수 없어요',
      ),
      noConnectionFailure: () => const ErrorMessage(
        title: '인터넷 연결 실패',
        message: '인터넷과 연결되어있지 않네요',
      ),
      getStorageDataFailure: () => const ErrorMessage(
        title: '로컬 스토리지 데이터 가져오기 실패',
        message: '저장된 사용자 정보를 불러올 수 없어요',
      ),
      notFoundFailure: () => const ErrorMessage(
        title: '404에러 발생 실패',
        message: '정보를 불러올 수 없어요',
      ),
      noUserDataFailure: () => const ErrorMessage(
        title: '유저 정보 불러오기 실패',
        message: '사용자 정보를 불러올 수 없어요',
      ),
      saveStorageDataFailure: () => const ErrorMessage(
        title: '로컬 스토리지 저장 실패',
        message: '저장된 사용자 정보를 불러올 수 없어요',
      ),
      undefinedFailure: () => const ErrorMessage(
        title: '지정되지 않은 에러',
        message: '정보를 불러올 수 없어요. 다시 시도해주세요',
      ),
      unauthorizedFailure: () => const ErrorMessage(
        title: '권한/토큰 오류',
        message: '정보를 가져올 수 없었어요',
      ),
      jwtTokenIssuingFailure: () => const ErrorMessage(
        title: 'jwt 토큰 신규 발행 오류',
        message: '사용자를 인증할 수 없었어요',
      ),
      jwtTokenRefreshFailure: () => const ErrorMessage(
        title: 'jwt 토큰 refresh  오류',
        message: '사용자를 인증이 만료되었어요',
      ),
    );
  }
}
