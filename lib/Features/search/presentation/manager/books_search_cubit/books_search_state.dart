part of 'books_search_cubit.dart';

sealed class BooksSearchState extends Equatable {
  const BooksSearchState();

  @override
  List<Object> get props => [];
}

final class BooksSearchInitial extends BooksSearchState {}

final class BooksSearchLoading extends BooksSearchState {}

final class BooksSearchSuccess extends BooksSearchState {
  List<BookModel> books;

  BooksSearchSuccess(this.books);
}

final class BooksSearchFauilre extends BooksSearchState {
  final String errorMessage;
  const BooksSearchFauilre(this.errorMessage);
}
