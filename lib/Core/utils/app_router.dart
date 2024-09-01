import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:readify_book_store_app/Core/utils/service_locator.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:readify_book_store_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:readify_book_store_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/book_details_view.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/home_view.dart';
import 'package:readify_book_store_app/Features/search/data/repos/search_repo_imp.dart';
import 'package:readify_book_store_app/Features/search/presentation/manager/books_search_cubit/books_search_cubit.dart';
import 'package:readify_book_store_app/Features/search/presentation/views/search_view.dart';
import 'package:readify_book_store_app/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => BooksSearchCubit(
            getIt.get<SearchRepoImp>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
