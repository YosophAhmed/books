import 'package:books/core/utils/styles.dart';
import 'package:books/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view.dart';
import 'books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: CustomAppbar(),
              ),
              SizedBox(
                height: 15,
              ),
              BooksListView(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                ),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
