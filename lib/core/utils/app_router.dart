import 'package:books/core/utils/service_locator.dart';
import 'package:books/features/home/data/models/BookModel.dart';
import 'package:books/features/home/data/repos/home_repo_impl.dart';
import 'package:books/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:books/features/home/presentation/views/book_details_view.dart';
import 'package:books/features/home/presentation/views/home_view.dart';
import 'package:books/features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kHomeView = '/homeView';
  static const String kBookDetailsView = '/bookDetailsView';
  static const String kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
