import '../entities/user.dart';
import '../interfaces/auth_repository.dart';

class SignupUseCase {
  final AuthRepository authRepository;

  SignupUseCase(this.authRepository);

  Future<User?> execute(String username, String password) {
    return authRepository.signup(username, password);
  }
}
