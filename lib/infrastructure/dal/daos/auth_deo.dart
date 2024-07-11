import 'package:getx_clean_architecture/domain/core/interfaces/auth_repository.dart';

import '../../../domain/core/entities/user.dart';
import '../services/api_service.dart';

class AuthDeo implements AuthRepository {
  final ApiService apiService;

  AuthDeo(this.apiService);

  @override
  Future<User?> login(String username, String password) async {
    // Simulate an API call
    if (username == "user" && password == "pass") {
      return User(username, password);
    }
    return null;
  }

  @override
  Future<User?> signup(String username, String password) async {
    // Simulate a successful signup
    return User(username, password);
  }
}
