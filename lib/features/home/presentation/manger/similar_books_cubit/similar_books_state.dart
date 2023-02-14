import '../../../data/models/BookModel.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  SimilarBooksSuccess({
    required this.books,
  });
}

class SimilarBooksError extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksError({
    required this.errorMessage,
  });
}
