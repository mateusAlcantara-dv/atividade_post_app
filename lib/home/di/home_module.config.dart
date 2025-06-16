// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:posts_app/home/di/home_module.dart' as _i976;
import 'package:posts_app/home/domain/repository/post_repository.dart' as _i578;
import 'package:posts_app/home/presentation/viewModel/post_store.dart' as _i308;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final homeModule = _$HomeModule();
    gh.factory<_i361.Dio>(() => homeModule.providesDio());
    gh.factory<_i578.PostRepository>(
      () => homeModule.providesRepository(gh<_i361.Dio>()),
    );
    gh.factory<_i308.PostStore>(
      () => _i308.PostStore(gh<_i578.PostRepository>()),
    );
    return this;
  }
}

class _$HomeModule extends _i976.HomeModule {}
