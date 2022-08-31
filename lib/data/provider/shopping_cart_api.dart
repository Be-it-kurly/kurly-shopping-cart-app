import '../../configs/constants/api_url.dart';
import '../../core/network_handling/network_service.dart';

class ShoppingCartAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getCartPrice(
      {required int peopleAmount,
      required String mealTime,
      required int daysNum}) async {
    try {
      Map<String, dynamic> cartPriceData = await _dio.apiCall(
          url: HttpUrl.GET_CART_PRICE,
          queryParameters: {
            "headcount": peopleAmount,
            "mealTime": mealTime,
            "days": daysNum
          },
          header: {"requiresToken": true},
          body: null,
          requestType: RequestType.GET);

      return cartPriceData;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCartResult({
    required int peopleAmount,
    required String mealTime,
    required int daysNum,
    required String keyword,
    required int price,
  }) async {
    try {
      Map<String, dynamic> cartResultData = await _dio.apiCall(
          url: HttpUrl.GET_RECIPE_LIST,
          queryParameters: {
            "headcount": peopleAmount,
            "mealTime": mealTime,
            "days": daysNum,
            "keyword": keyword,
            "price": price,
          },
          header: {"requiresToken": true},
          body: null,
          requestType: RequestType.GET);

      return cartResultData;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateSoldCartResult(
      {required int searchCount,
      required Map<String, dynamic> updateCartData}) async {
    try {
      var result = await _dio.apiCall(
          url: HttpUrl.UPDATE_SOLD_CART,
          queryParameters: null,
          header: {"requiresToken": true},
          body: {"searchCount": searchCount, ...updateCartData},
          requestType: RequestType.POST);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
