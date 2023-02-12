import 'package:books/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final HomeRepo homeRepo;

  FeaturedBooksCubit(
    this.homeRepo,
  ) : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksError(
            errorMessage: failure.failMessage,
          ),
        );
      },
      (books) {
        emit(
          FeaturedBooksSuccess(
            books: books,
          ),
        );
      },
    );
  }
}
