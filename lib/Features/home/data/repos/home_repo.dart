import 'package:dartz/dartz.dart';
import 'package:readify_book_store_app/Core/errors/failures.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchNewsetBooks();

  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();

  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
