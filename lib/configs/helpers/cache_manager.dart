// ignore_for_file: constant_identifier_names
import 'package:get_storage/get_storage.dart';
import 'package:kurly_shopping_cart_app/core/error_handling/exceptions.dart';
import '../constants/enum.dart';

class CacheManager {
  Future<bool> saveCache(
    CacheControllerKey cacheControllerKey,
    String? value,
  ) async {
    try {
      final box = GetStorage();
      await box.write(cacheControllerKey.toString(), value);

      return true;
    } catch (e) {
      throw (LocalStorageException());
    }
  }

  String getCache(CacheControllerKey cacheControllerKey) {
    try {
      final box = GetStorage();
      String? cacheResult = box.read(cacheControllerKey.toString());
      return (cacheResult == null) ? '' : cacheResult;
    } catch (e) {
      throw (LocalStorageException());
    }
  }

  Future<void> removeCache(CacheControllerKey cacheControllerKey) async {
    try {
      final box = GetStorage();
      await box.remove(cacheControllerKey.toString());
    } catch (e) {
      throw (LocalStorageException());
    }
  }

  Future<void> clearCache() async {
    try {
      final box = GetStorage();
      await box.erase();
    } catch (e) {
      throw (LocalStorageException());
    }
  }
}
