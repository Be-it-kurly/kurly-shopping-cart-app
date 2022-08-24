import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/controller/ui_interpreter/failure_ui_interpreter.dart';

import '../configs/constants/constants.dart';
import '../configs/constants/enum.dart';
import '../core/error_handling/failures.dart';
import '../data/model/user.dart';
import '../data/repository/auth_repository.dart';
import '../routes/routes.dart';
import '../ui/widgets/loading/loading.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final AuthRepository _authRepository = AuthRepository();
  final List<String> _userIdList = Constants.USER_ID_LIST;
  final List<KurlyUser> _kurlyUserList = [];
  late KurlyUser _currentUser;
  List<KurlyUser> get kurlyUserList => _kurlyUserList;
  KurlyUser get currentUser => _currentUser;

  @override
  onInit() async {
    super.onInit();
    await _setUserList();
    await Future.delayed(const Duration(milliseconds: 400));
    _setInitialPage();
  }

  _setInitialPage() {
    if (_kurlyUserList.isNotEmpty) {
      Get.offAllNamed(Routes.START);
    }
  }

  setCurrentUser({required KurlyUser selectedUser}) async {
    _currentUser = selectedUser;
    await _authRepository.saveJwtTokenWithUserId(
      userId: selectedUser.userId,
    );
  }

  Future<void> _setUserList() async {
    Either<Failure, List<KurlyUser>> kurlyUserEither =
        await _authRepository.getUserList();

    kurlyUserEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'setUserInfo');
    }, (users) {
      _kurlyUserList.assignAll(users);
    });
  }

  updatePageView({required int isInit}) async {
    await _authRepository.updatePageView(isInit: isInit);
  }
}
