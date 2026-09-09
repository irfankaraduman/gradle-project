import 'dart:io';

String? Password = stdin.readLineSync();

class CommentService {
  void postComment(String comment) {
    print(comment);
  }
}

void main() {
  var service = CommentService();
  service.postComment(Password!);
}
