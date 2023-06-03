import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/task1/repository/web_services/task1_client_service.dart';
import '../consts/constants.dart';
import '../consts/exports.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}

@module
abstract class InjectionModule {
  // @preResolve
  // Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  @injectable
  GlobalKey<NavigatorState> get nav => GlobalKey<NavigatorState>();

  @injectable
  Random get random => Random();

  @injectable
  TextEditingController get textEditingController => TextEditingController();

  @injectable
  ScrollController get scrollController => ScrollController();

  @injectable
  Task1ClientService get task1ClientService => Task1ClientService(dio);

  @injectable
  Dio get dio => Dio(
        BaseOptions(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          baseUrl: Constants.URL,
          receiveTimeout: const Duration(milliseconds: Constants.API_TIMEOUT),
          sendTimeout: const Duration(milliseconds: Constants.API_TIMEOUT),
        ),
      )..interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
}
