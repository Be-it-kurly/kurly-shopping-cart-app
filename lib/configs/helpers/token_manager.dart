// import 'package:withconi/configs/constants/enum.dart';
// import 'package:withconi/configs/helpers/extension.dart';
// import 'package:withconi/configs/helpers/cache_manager.dart';

// import '../constants/enum.dart';

// @override
// class KurlyCacheManager with CacheManager {
//   String getToken(CacheControllerKey cacheControllerKey) =>
//       getCache(cacheControllerKey);

//   void saveAccessToken(String token) =>
//       saveCache(CacheControllerKey.ACCESS_TOKEN, token);

//   void saveRefreshToken(String token) =>
//       saveCache(CacheControllerKey.REFRESH_TOKEN, token);

//   void saveProvider(Provider tokenProvider) =>
//       saveCache(CacheControllerKey.PROVIDER, tokenProvider.toString());

//   void saveEmailVerificationInfo(
//       {required String isEmailVerified, required String isEmailVerifySkipped}) {
//     saveCache(CacheControllerKey.EMAIL_VERIFIED, isEmailVerified);
//     saveCache(CacheControllerKey.EMAIL_VERIFY_SKIPPED, isEmailVerifySkipped);
//   }

//   Future<void> removeAllcache() async {
//     await clearCache();
//   }
// }