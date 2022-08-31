import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/configs/constants/constants.dart';
import 'package:kurly_shopping_cart_app/configs/constants/enum.dart';
import 'package:kurly_shopping_cart_app/configs/helpers/token_manager.dart';
import 'package:kurly_shopping_cart_app/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:kurly_shopping_cart_app/core/network_handling/network_service.dart';
import 'package:kurly_shopping_cart_app/data/model/response.dart';
import 'package:kurly_shopping_cart_app/data/model/user.dart';
import 'package:kurly_shopping_cart_app/data/provider/auth_api.dart';
import '../../configs/helpers/cache_manager.dart';
import '../../core/error_handling/exceptions.dart';
import '../../core/error_handling/failures.dart';

class AuthRepository {
  final CacheManager _cacheManager = CacheManager();
  final AuthAPI _api = AuthAPI();

  Future<Either<Failure, String>> issueJwtTokenWithUserId({
    required String userId,
  }) async {
    try {
      String token = TokenManager().issueToken(userId: userId);
      // await _cacheManager.saveCache(CacheControllerKey.userId, userId);
      // await _cacheManager.saveCache(CacheControllerKey.token, token);

      return Right(token);
    } on JwtTokenSigningException {
      return const Left(JwtTokenIssuingFailure());
    } on NoInternetConnectionException {
      return const Left(NoConnectionFailure());
    } on TimeOutException {
      return const Left(DioOtherFailure());
    } on BadRequestException {
      return Left(DioOtherFailure());
    } on InternalServerErrorException {
      return const Left(DioOtherFailure());
    } on ConflictException {
      return const Left(DioOtherFailure());
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on LocalStorageException {
      return const Left(SaveStorageDataFailure());
    } catch (e) {
      return const Left(UndefinedFailure());
    }
  }

  Future<Either<Failure, String>> saveUserIdAndTokenCache(
      {required String userId, required String token}) async {
    try {
      await _cacheManager.saveCache(CacheControllerKey.userId, userId);
      await _cacheManager.saveCache(CacheControllerKey.token, token);

      return Right(token);
    } on JwtTokenSigningException {
      return const Left(JwtTokenRefreshFailure());
    } on NoInternetConnectionException {
      return const Left(NoConnectionFailure());
    } on TimeOutException {
      return const Left(DioOtherFailure());
    } on BadRequestException {
      return Left(DioOtherFailure());
    } on InternalServerErrorException {
      return const Left(DioOtherFailure());
    } on ConflictException {
      return const Left(DioOtherFailure());
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on LocalStorageException {
      return const Left(SaveStorageDataFailure());
    } catch (e) {
      return const Left(UndefinedFailure());
    }
  }

  Future<Either<Failure, List<KurlyUser>>> getUserList() async {
    try {
      Map<String, dynamic> data = await _api.getUserList();
      List<KurlyUser> userList = KurlyUserResponse.fromJson(data).results;
      return Right(userList);
    } on NoInternetConnectionException {
      return const Left(NoConnectionFailure());
    } on TimeOutException {
      return const Left(DioOtherFailure());
    } on BadRequestException {
      return const Left(DioOtherFailure());
    } on InternalServerErrorException {
      return const Left(DioOtherFailure());
    } on ConflictException {
      return const Left(DioOtherFailure());
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } catch (e) {
      return const Left(UndefinedFailure());
    }
  }

  Future<Either<Failure, bool>> updatePageView({required int isInit}) async {
    try {
      await _api.updatePageView(isInit: isInit);
      return Right(true);
    } on NoInternetConnectionException {
      return const Left(NoConnectionFailure());
    } on TimeOutException {
      return const Left(DioOtherFailure());
    } on BadRequestException {
      return const Left(DioOtherFailure());
    } on InternalServerErrorException {
      return const Left(DioOtherFailure());
    } on ConflictException {
      return const Left(DioOtherFailure());
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on DataParsingException {
      return const Left(DataParsingFailure());
    } catch (e) {
      return const Left(UndefinedFailure());
    }
  }
}
