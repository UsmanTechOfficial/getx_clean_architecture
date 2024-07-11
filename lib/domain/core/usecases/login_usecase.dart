import '../entities/user.dart';
import '../interfaces/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<User?> execute(String username, String password) {
    return authRepository.login(username, password);
  }
}
