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
import 'package:kurly_shopping_cart_app/data/provider/keyword_api.dart';
import 'package:kurly_shopping_cart_app/ui/pages/shopping_cart/shopping_cart_1_page.dart';
import '../../configs/helpers/cache_manager.dart';
import '../../core/error_handling/exceptions.dart';
import '../../core/error_handling/failures.dart';
import '../model/keyword.dart';

class KeywordRepository {
  final KeywordAPI _api = KeywordAPI();

  Future<Either<Failure, Map<KeywordType, List<String>>>>
      getKeywordList() async {
    try {
      Map<String, dynamic> data = await _api.getUserKeyword();
      Map<KeywordType, List<String>> keywordMap =
          KeywordResponse.fromJson(data).keywordMap;
      return Right(keywordMap);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on TimeOutException {
      return Left(DioOtherFailure());
    } on BadRequestException {
      return Left(DioOtherFailure());
    } on InternalServerErrorException {
      return Left(DioOtherFailure());
    } on ConflictException {
      return Left(DioOtherFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } catch (e) {
      return Left(UndefinedFailure());
    }
  }
}
