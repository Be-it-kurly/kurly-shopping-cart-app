import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:kurly_shopping_cart_app/configs/helpers/cache_manager.dart';
import 'package:kurly_shopping_cart_app/core/error_handling/failures.dart';

import '../constants/constants.dart';
import '../constants/enum.dart';

@override
class TokenManager {
  String issueToken({required String userId}) {
    try {
      final jwt = JWT(
        {"userId": userId},
      );
      String token = jwt.sign(SecretKey(Constants.JWT_SECRET_KEY));
      return token;
    } catch (e) {
      throw (JwtTokenIssuingFailure());
    }
  }

  String refreshToken() {
    try {
      String userId = CacheManager().getCache(CacheControllerKey.userId);
      final jwt = JWT(
        {"userId": userId},
      );
      String token = jwt.sign(SecretKey(Constants.JWT_SECRET_KEY));
      return token;
    } catch (e) {
      throw (JwtTokenRefreshFailure());
    }
  }
}
