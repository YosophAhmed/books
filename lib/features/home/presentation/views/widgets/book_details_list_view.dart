import 'package:books/core/widgets/custom_error_widget.dart';
import 'package:books/core/widgets/custom_loading_indicator.dart';
import 'package:books/features/home/data/models/BookModel.dart';
import 'package:books/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:books/features/home/presentation/manger/similar_books_cubit/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cutsom_book_item.dart';

class BookDetailsListView extends StatelessWidget {
  final BookModel bookModel;

  const BookDetailsListView({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                child: CustomBookItem(
                  url: state.books[index].volumeInfo.imageLinks.thumbnail,
                ),
              ),
            ),
          );
        } else if (state is SimilarBooksError) {
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
