import 'package:posts_app/home/domain/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
