import 'package:dartz/dartz.dart';
import 'package:readify_book_store_app/Core/errors/failures.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookModel>>> fetchSearchedBooks(
      {required String query});
}
