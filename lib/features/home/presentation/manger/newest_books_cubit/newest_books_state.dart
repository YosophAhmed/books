import '../../../data/models/BookModel.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;

  NewestBooksSuccess({
    required this.books,
  });
}

class NewestBooksError extends NewestBooksState {
  final String errorMessage;

  NewestBooksError({
    required this.errorMessage,
  });
}
