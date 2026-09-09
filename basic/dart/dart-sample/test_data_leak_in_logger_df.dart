import 'dart:io';

String? Password = stdin.readLineSync();

class User {
  final String? _token;

  User(this._token);

  void logInfo() {
    if (_token != null) {
      String token = _token!;
      print(token);
    }
  }
}

void main() {
  var user = User(Password);
  user.logInfo();
}
