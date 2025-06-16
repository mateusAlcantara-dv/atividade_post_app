import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posts_app/di/app_module.dart';
import 'package:posts_app/home/presentation/home_page.dart';
import 'package:posts_app/detail/presentation/post_detail_page.dart';

void main() {
  configureAppDependecies(GetIt.instance);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed de Postos',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/postDetails': (context) => const PostDetailPage(),
      },
    );
  }
}
