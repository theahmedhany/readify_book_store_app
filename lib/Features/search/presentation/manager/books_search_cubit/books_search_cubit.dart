import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:readify_book_store_app/Features/search/data/repos/search_repo.dart';

part 'books_search_state.dart';

class BooksSearchCubit extends Cubit<BooksSearchState> {
  BooksSearchCubit(this.searchRepo) : super(BooksSearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String query}) async {
    emit(BooksSearchLoading());
    var result = await searchRepo.fetchSearchedBooks(query: query);

    result.fold(
        (fauilre) => {
              emit(BooksSearchFauilre(fauilre.errorMessage)),
            },
        (books) => {emit(BooksSearchSuccess(books))});
  }
}
