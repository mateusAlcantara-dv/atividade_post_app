import 'package:flutter/material.dart';
import 'package:posts_app/home/domain/models/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: ListTile(
        title: Text(
          post.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () {
          Navigator.pushNamed(context, '/postDetails', arguments: post);
        },
      ),
    );
  }
}
