import 'package:get/get.dart';
import 'package:getx_clean_architecture/domain/core/interfaces/auth_repository.dart';
import 'package:getx_clean_architecture/domain/core/usecases/login_usecase.dart';
import 'package:getx_clean_architecture/infrastructure/dal/daos/auth_deo.dart';

import '../../../../domain/core/usecases/signup_usecase.dart';
import '../../../../presentation/auth/controllers/auth.controller.dart';
import '../../../dal/services/api_service.dart';

class AuthControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService(baseUrl: 'https://example.com/api'));
    Get.lazyPut<AuthRepository>(() => AuthDeo(Get.find()));
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => SignupUseCase(Get.find()));
    Get.lazyPut<AuthController>(() => AuthController(Get.find(), Get.find()));
  }
}
