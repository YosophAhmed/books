import 'package:dartz/dartz.dart';

import '../models/BookModel.dart';

abstract class HomeRepo {
  Future<Either<Error, List<BookModel>>> fetchBestSellerBooks();

  Future<Either<Error, List<BookModel>>> fetchFeaturedBooks();
}
