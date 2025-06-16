import 'package:dio/dio.dart';
import 'package:posts_app/home/data/models/post_reponse.dart';
import 'package:posts_app/home/domain/models/post.dart';
import 'package:posts_app/home/domain/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  PostRepositoryImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<Post>> getPosts() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
    );

    final jsonList = response.data as List;
    final data = jsonList
        .map((item) => PostReponse.fromJson(item).toDomain())
        .toList();
    return data;
  }
}
