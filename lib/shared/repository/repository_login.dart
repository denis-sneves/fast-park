import 'package:fast_park/shared/models/user_model.dart';
import 'package:fast_park/shared/provider/provider_login.dart';

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Future<User> login(
    String email,
    String password,
  ) async {
    Map<String, dynamic>? json = await apiClient.login(email, password);
    return User.fromJson(json!);
  }
}
