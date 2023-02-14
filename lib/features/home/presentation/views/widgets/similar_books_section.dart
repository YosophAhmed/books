import 'package:books/features/home/data/models/BookModel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_details_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  final BookModel bookModel;

  const SimilarBooksSection({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BookDetailsListView(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
