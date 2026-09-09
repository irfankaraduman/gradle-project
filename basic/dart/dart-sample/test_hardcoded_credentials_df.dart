class AuthService {
  final String username = 'admin';
  final String password = 'P@ssw0rd!';

  void login(String user, String pass) {
    if (user == username && pass == password) {
      print('Login success');
    } else {
      print('Login failed');
    }
  }
}

void main() {
  var auth = AuthService();
  auth.login('admin', 'P@ssw0rd!');
}
