import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:posts_app/home/presentation/viewModel/post_store.dart';
import 'package:posts_app/home/presentation/widgets/post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PostStore postStore;

  @override
  void initState() {
    postStore = GetIt.I.get();
    postStore.fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed de Posts')),
      body: Observer(
        builder: (_) {
          if (postStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (postStore.errorMessage != null) {
            return Center(
              child: Text(
                'Erro: ${postStore.errorMessage}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (postStore.posts.isEmpty) {
            return const Center(child: Text('Nenhum post encontrado.'));
          }

          return ListView.builder(
            itemCount: postStore.posts.length,
            itemBuilder: (context, index) {
              final post = postStore.posts[index];
              return PostCard(post: post);
            },
          );
        },
      ),
    );
  }
}
