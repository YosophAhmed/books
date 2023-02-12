import 'package:books/core/utils/api_service.dart';
import 'package:books/features/home/data/models/BookModel.dart';
import 'package:books/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(
    this.apiService,
  );

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest',
      );
      List<BookModel> books = [];
      for (var book in data['items']) {
        books.add(
          BookModel.fromJson(book),
        );
      }
      return right(books);
    } catch (error) {
      if (error is DioError) {
        return left(
          ServerFailure.fromDioError(
            error,
          ),
        );
      }
      return left(
        ServerFailure(
          error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
