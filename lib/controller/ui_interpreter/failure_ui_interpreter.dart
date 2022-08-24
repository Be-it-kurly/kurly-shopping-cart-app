import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kurly_shopping_cart_app/core/error_handling/exceptions.dart';
import '../../core/error_handling/error_message_object.dart';
import '../../core/error_handling/failures.dart';
import '../../ui/widgets/snackbar/snackbar.dart';

class FailureInterpreter {
  FailureInterpreter._internal();
  static final _singleton = FailureInterpreter._internal();
  factory FailureInterpreter() => _singleton;

  mapFailureToDialog(Failure _failure, String occurMethod) {
    ErrorMessage errorMessage =
        ErrorMessage.mapFailureToErrorMessage(failure: _failure);

    if (kDebugMode) {
      print(
        '\n❤️‍🔥 FAIL[$_failure] => METHOD FROM: $occurMethod\n📍 title: ${errorMessage.title}\n📍 message: ${errorMessage.message}',
      );
    }

    return showSnackbar(text: errorMessage.message);
  }

  mapFailureToSnackbar(Failure failure, String occurMethod) {
    ErrorMessage errorMessage =
        ErrorMessage.mapFailureToErrorMessage(failure: failure);

    if (kDebugMode) {
      print(
        '\n❤️‍🔥 FAIL[$failure] => METHOD FROM: $occurMethod\n📍 title: ${errorMessage.title}\n📍 message: ${errorMessage.message}',
      );
    }

    return showSnackbar(text: errorMessage.message);
  }

  mapFailureToPage(Failure failure, String occurMethod) {
    ErrorMessage errorMessage =
        ErrorMessage.mapFailureToErrorMessage(failure: failure);
    if (kDebugMode) {
      print(
        '\n❤️‍🔥 FAIL[$failure] => METHOD FROM: $occurMethod\n📍 title: ${errorMessage.title}\n📍 message: ${errorMessage.message}',
      );
    }
    return showSnackbar(text: errorMessage.message);
  }
}
