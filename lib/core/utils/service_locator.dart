// (Service locator or dependency injection = Singleton) provided by package ==> get_it
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nova_phone/core/utils/api_service.dart';
import 'package:nova_phone/features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
