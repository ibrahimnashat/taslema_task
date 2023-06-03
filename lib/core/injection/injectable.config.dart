// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:math' as _i10;

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:taslema_task/core/consts/exports.dart' as _i5;
import 'package:taslema_task/core/consts/validation.dart' as _i13;
import 'package:taslema_task/core/framework/network.dart' as _i9;
import 'package:taslema_task/core/framework/safe_request_handler.dart' as _i11;
import 'package:taslema_task/core/injection/injectable.dart' as _i18;
import 'package:taslema_task/core/widgets/context.dart' as _i8;
import 'package:taslema_task/core/widgets/dropdown/cubit/dropdown_cubit.dart'
    as _i4;
import 'package:taslema_task/features/task1/logic/posts_bloc.dart' as _i16;
import 'package:taslema_task/features/task1/logic/user_Info_bloc.dart' as _i17;
import 'package:taslema_task/features/task1/repository/usecases/get_posts.dart'
    as _i14;
import 'package:taslema_task/features/task1/repository/usecases/get_user.dart'
    as _i15;
import 'package:taslema_task/features/task1/repository/web_services/task1_client_service.dart'
    as _i12;
import 'package:taslema_task/features/task2/logic/home_bloc.dart' as _i6;
import 'package:taslema_task/features/task2/logic/main_bloc.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.factory<_i3.Dio>(() => injectionModule.dio);
    gh.factory<_i4.DropdownCubit>(() => _i4.DropdownCubit());
    gh.factory<_i5.GlobalKey<_i5.NavigatorState>>(() => injectionModule.nav);
    gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc());
    gh.factory<_i7.MainBloc>(() => _i7.MainBloc());
    gh.factory<_i8.MainContext>(
        () => _i8.Root(nav: gh<_i5.GlobalKey<_i5.NavigatorState>>()));
    gh.factory<_i9.Network>(() => _i9.NetworkStatus());
    gh.factory<_i10.Random>(() => injectionModule.random);
    gh.factory<_i11.SafeApi>(() => _i11.SafeApi(gh<_i9.Network>()));
    gh.factory<_i5.ScrollController>(() => injectionModule.scrollController);
    gh.factory<_i12.Task1ClientService>(
        () => injectionModule.task1ClientService);
    gh.factory<_i5.TextEditingController>(
        () => injectionModule.textEditingController);
    gh.lazySingleton<_i13.Validate>(() => _i13.Validate());
    gh.factory<_i14.GetPosts>(() => _i14.GetPosts(
          clientService: gh<_i12.Task1ClientService>(),
          api: gh<_i11.SafeApi>(),
        ));
    gh.factory<_i15.GetUser>(() => _i15.GetUser(
          clientService: gh<_i12.Task1ClientService>(),
          api: gh<_i11.SafeApi>(),
        ));
    gh.factory<_i16.PostsBloc>(() => _i16.PostsBloc(gh<_i14.GetPosts>()));
    gh.factory<_i17.UserInfoBloc>(() => _i17.UserInfoBloc(gh<_i15.GetUser>()));
    return this;
  }
}

class _$InjectionModule extends _i18.InjectionModule {}
