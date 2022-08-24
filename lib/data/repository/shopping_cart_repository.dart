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
import 'package:kurly_shopping_cart_app/data/provider/shopping_cart_api.dart';
import 'package:kurly_shopping_cart_app/ui/pages/shopping_cart/shopping_cart_1_page.dart';
import '../../configs/helpers/cache_manager.dart';
import '../../controller/shopping_cart/shopping_cart_step2_controller.dart';
import '../../core/error_handling/exceptions.dart';
import '../../core/error_handling/failures.dart';
import '../model/ingredients.dart';
import '../model/keyword.dart';
import '../model/recipe.dart';

class ShoppingCartRepository {
  final ShoppingCartAPI _api = ShoppingCartAPI();

  Future<Either<Failure, CartPriceResponse>> getCartPrice(
      {required int peopleAmount,
      required List<Meal> mealTime,
      required int daysNum}) async {
    try {
      List<String> mealTimeList =
          mealTime.map((meal) => mealToEnglish(meal)).toList();
      String mealTimeListString = mealTimeList.join(', ');
      Map<String, dynamic> data = await _api.getCartPrice(
          daysNum: daysNum,
          mealTime: mealTimeListString,
          peopleAmount: peopleAmount);
      CartPriceResponse cartPriceResponse = CartPriceResponse.fromJson(data);
      return Right(cartPriceResponse);
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

  Future<Either<Failure, CartResultResponse>> getCartResult(
      {required int peopleAmount,
      required List<Meal> mealTime,
      required List<String> keywordList,
      required int daysNum,
      required int price}) async {
    try {
      List<String> mealTimeList =
          mealTime.map((meal) => mealToEnglish(meal)).toList();
      String mealTimeListString = mealTimeList.join(',');
      String keywordListString = keywordList.join(',');
      Map<String, dynamic> data = await _api.getCartResult(
          daysNum: daysNum,
          mealTime: mealTimeListString,
          peopleAmount: peopleAmount,
          keyword: keywordListString,
          price: price);
      CartResultResponse cartResultResponse = CartResultResponse.fromJson(data);
      return Right(cartResultResponse);
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

  Future<Either<Failure, bool>> updateSoldCart(
      {required int searchCount,
      required CartResultResponse cartResult}) async {
    try {
      Map<String, dynamic> cartResultMap = cartResult.toJson();
      await _api.updateSoldCartResult(
          updateCartData: cartResultMap, searchCount: searchCount);

      return Right(true);
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
