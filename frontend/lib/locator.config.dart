// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:frontend/repository/module.dart' as _i603;
import 'package:frontend/repository/pdf_repository.dart' as _i261;
import 'package:frontend/ui/pages/home/bloc/home_bloc.dart' as _i731;
import 'package:frontend/ui/pages/home/pages/split/bloc/split_bloc.dart'
    as _i320;
import 'package:frontend/ui/router/router.dart' as _i300;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final repositoryModule = _$RepositoryModule();
    gh.factory<_i261.PdfRepository>(() => repositoryModule.pdfRepository);
    gh.singleton<_i300.AppRouter>(() => _i300.AppRouter());
    gh.factory<_i320.SplitBloc>(
      () => _i320.SplitBloc(gh<_i261.PdfRepository>()),
    );
    gh.factory<_i731.HomeBloc>(
      () => _i731.HomeBloc(gh<_i300.AppRouter>(), gh<_i261.PdfRepository>()),
    );
    return this;
  }
}

class _$RepositoryModule extends _i603.RepositoryModule {}
