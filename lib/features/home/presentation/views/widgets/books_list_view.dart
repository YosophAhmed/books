import 'package:books/core/utils/app_router.dart';
import 'package:books/core/widgets/custom_error_widget.dart';
import 'package:books/core/widgets/custom_loading_indicator.dart';
import 'package:books/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:books/features/home/presentation/manger/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cutsom_book_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: state.books[index],
                    );
                  },
                  child: CustomBookItem(
                    url: state.books[index].volumeInfo.imageLinks.thumbnail,
                  ),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksError) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
