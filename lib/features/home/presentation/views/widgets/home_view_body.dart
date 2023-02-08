import 'package:books/core/utils/styles.dart';
import 'package:books/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppbar(),
          BooksListView(),
          SizedBox(
            height: 50,
          ),
          Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 25,
          ),
          BestSellerItem(
            url:
                'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg',
          ),
        ],
      ),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  final String url;

  const BestSellerItem({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 2.6 / 4,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: url,
                errorWidget: (
                  context,
                  url,
                  error,
                ) =>
                    const Icon(
                  Icons.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
