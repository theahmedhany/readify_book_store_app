import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:readify_book_store_app/Features/home/data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();

    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errorMessage));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
