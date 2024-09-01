import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:readify_book_store_app/Core/errors/failures.dart';
import 'package:readify_book_store_app/Core/utils/api_service.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:readify_book_store_app/Features/search/data/repos/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;

  SearchRepoImp({required this.apiService});
  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchedBooks(
      {required String query}) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=$query&Filtering=free-ebooks',
      );

      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
