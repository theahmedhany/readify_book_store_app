import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readify_book_store_app/Core/utils/styles.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/books_list_view.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(child: CustomAppBar()),
              BooksListView(),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle26,
                ),
              ),
              SizedBox(height: 6),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
