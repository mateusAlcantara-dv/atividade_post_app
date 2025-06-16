import 'package:posts_app/home/domain/models/post.dart';

class PostReponse {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostReponse({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostReponse.fromJson(Map<String, dynamic> json) {
    return PostReponse(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Post toDomain() => Post(userId: userId, id: id, title: title, body: body);
}
