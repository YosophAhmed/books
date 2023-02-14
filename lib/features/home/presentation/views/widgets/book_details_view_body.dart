import 'package:books/features/home/data/models/BookModel.dart';
import 'package:books/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;

  const BookDetailsViewBody({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children:  [
                const CustomAppBarBookDetails(),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                const SizedBox(
                  height: 15,
                ),
                SimilarBooksSection(
                  bookModel: bookModel,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
