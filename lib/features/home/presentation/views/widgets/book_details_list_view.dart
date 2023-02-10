import 'package:flutter/material.dart';

import 'cutsom_book_item.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          child: CustomBookItem(
            url:
            'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg',
          ),
        ),
      ),
    );
  }
}
