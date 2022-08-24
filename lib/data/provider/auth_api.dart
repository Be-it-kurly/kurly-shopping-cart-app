import '../../configs/constants/api_url.dart';
import '../../core/network_handling/network_service.dart';

class AuthAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getUserList() async {
    try {
      Map<String, dynamic> userData = await _dio.apiCall(
          url: HttpUrl.GET_USER_LIST,
          queryParameters: null,
          body: null,
          requestType: RequestType.GET);

      return userData;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updatePageView({required int isInit}) async {
    try {
      Map<String, dynamic> userData = await _dio.apiCall(
          url: HttpUrl.UPDATE_PAGEVIEW,
          queryParameters: null,
          body: {"isInit": isInit},
          header: {"requiresToken": true},
          requestType: RequestType.POST);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
