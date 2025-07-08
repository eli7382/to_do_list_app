class AuthService {
  Future<bool> login(String username, String password) async {
    // TODO: implement real authentication
    await Future.delayed(const Duration(milliseconds: 500));
    return username.isNotEmpty && password.isNotEmpty;
  }
}

