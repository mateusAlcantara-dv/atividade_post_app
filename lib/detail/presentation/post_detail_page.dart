import 'package:flutter/material.dart';
import 'package:posts_app/home/domain/models/post.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as Post;
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: Theme.of(context).textTheme.headlineMedium),
            Text(
              'ID usuário: ${post.userId} - ID post: ${post.id}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Text(post.body, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
