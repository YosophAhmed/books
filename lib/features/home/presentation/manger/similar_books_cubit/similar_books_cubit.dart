import 'package:books/features/home/presentation/manger/similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(
    this.homeRepo,
  ) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({
    required String category,
  }) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(
      category: category,
    );
    result.fold(
      (failure) {
        emit(
          SimilarBooksError(
            errorMessage: failure.failMessage,
          ),
        );
      },
      (books) {
        emit(
          SimilarBooksSuccess(
            books: books,
          ),
        );
      },
    );
  }
}
