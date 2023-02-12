import '../../../data/models/BookModel.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;

  FeaturedBooksSuccess({
    required this.books,
  });
}

class FeaturedBooksError extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksError({
    required this.errorMessage,
  });
}
