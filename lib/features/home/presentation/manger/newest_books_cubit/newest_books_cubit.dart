import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final HomeRepo homeRepo;

  NewestBooksCubit(
    this.homeRepo,
  ) : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold(
      (failure) {
        emit(
          NewestBooksError(
            errorMessage: failure.failMessage,
          ),
        );
      },
      (books) {
        emit(
          NewestBooksSuccess(
            books: books,
          ),
        );
      },
    );
  }
}
