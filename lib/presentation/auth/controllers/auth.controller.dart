import 'package:get/get.dart';
import 'package:getx_clean_architecture/domain/core/usecases/login_usecase.dart';

import '../../../domain/core/entities/user.dart';
import '../../../domain/core/exception/auth_exception.dart';
import '../../../domain/core/usecases/signup_usecase.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;

  AuthController(this.loginUseCase, this.signupUseCase);

  var username = ''.obs;
  var password = ''.obs;
  var user = Rx<User?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void login() async {
    isLoading.value = true;
    try {
      user.value = await loginUseCase.execute(username.value, password.value);
      errorMessage.value = '';
    } catch (e) {
      if (e is AuthException) {
        errorMessage.value = e.message;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void signup() async {
    isLoading.value = true;
    try {
      user.value = await signupUseCase.execute(username.value, password.value);
      errorMessage.value = '';
    } catch (e) {
      if (e is AuthException) {
        errorMessage.value = e.message;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
