import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:posts_app/home/domain/models/post.dart';
import 'package:posts_app/home/domain/repository/post_repository.dart';

part 'post_store.g.dart';

@injectable
class PostStore = _PostStoreBase with _$PostStore;

abstract class _PostStoreBase with Store {
  final PostRepository repository;

  _PostStoreBase(this.repository);

  @observable
  ObservableList<Post> posts = ObservableList<Post>();

  @observable
  bool isLoading = true;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchPosts() async {
    try {
      isLoading = true;
      errorMessage = null;

      final result = await repository.getPosts();
      posts = ObservableList.of(result);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
