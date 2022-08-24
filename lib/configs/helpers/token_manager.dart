import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:kurly_shopping_cart_app/configs/helpers/cache_manager.dart';

import '../constants/constants.dart';
import '../constants/enum.dart';

@override
class TokenManager {
  String issueToken({required String userId}) {
    final jwt = JWT(
      {"userId": userId},
    );
    String token = jwt.sign(SecretKey(Constants.JWT_SECRET_KEY));
    return token;
  }

  String refreshToken() {
    String userId = CacheManager().getCache(CacheControllerKey.userId);
    print(userId);
    final jwt = JWT(
      {"userId": userId},
    );
    String token = jwt.sign(SecretKey(Constants.JWT_SECRET_KEY));
    return token;
  }
}
