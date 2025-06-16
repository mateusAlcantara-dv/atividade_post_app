import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:posts_app/home/data/repository/post_repository_impl.dart';
import 'package:posts_app/home/domain/repository/post_repository.dart';
import 'home_module.config.dart';

@InjectableInit()
configureHomeDependecies(GetIt getIt) => getIt.init();

@module
abstract class HomeModule {
  PostRepository providesRepository(Dio dio) => PostRepositoryImpl(dio: dio);

  Dio providesDio() => Dio();
}
