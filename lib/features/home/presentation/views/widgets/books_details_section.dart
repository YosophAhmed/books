import 'package:books/features/home/data/models/BookModel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action_button.dart';
import 'cutsom_book_item.dart';

class BookDetailsSection extends StatelessWidget {

  final BookModel bookModel;

  const BookDetailsSection({Key? key, required this.bookModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width / 5,
            vertical: 10,
          ),
          child: CustomBookItem(
            url:
            bookModel.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 10,
        ),
        const BooksActionButton(),
      ],
    );
  }
}
