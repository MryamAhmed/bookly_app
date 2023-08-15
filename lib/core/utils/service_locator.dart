import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home_repo_implem.dart';
import 'api_service.dart';
import 'package:dio/dio.dart';


final getIt = GetIt.instance;

void  setUp(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(
         getIt.get<ApiService>()
      )
  );
}