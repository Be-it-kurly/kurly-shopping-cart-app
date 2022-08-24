import '../../configs/constants/api_url.dart';
import '../../core/network_handling/network_service.dart';

class KeywordAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getUserKeyword() async {
    try {
      Map<String, dynamic> keywordData = await _dio.apiCall(
          url: HttpUrl.GET_KEYWORDS,
          queryParameters: null,
          body: null,
          header: {'requiresToken': true},
          requestType: RequestType.GET);

      return keywordData;
    } catch (e) {
      rethrow;
    }
  }
}
