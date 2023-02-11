import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/best_seller_item.dart';
import 'custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 30.0,
      ),
      child: Column(
        children: const [
          CustomTextField(),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: SearchListView(),
          ),
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
        child: BestSellerItem(
          url: '',
        ),
      ),
    );
  }
}
