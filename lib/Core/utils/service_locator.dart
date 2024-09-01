import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:readify_book_store_app/Core/utils/api_service.dart';
import 'package:readify_book_store_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:readify_book_store_app/Features/search/data/repos/search_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImp>(
    SearchRepoImp(
      apiService: ApiService(Dio()),
    ),
  );
}
