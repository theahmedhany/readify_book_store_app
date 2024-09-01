import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:readify_book_store_app/Core/utils/app_router.dart';
import 'package:readify_book_store_app/Core/widgets/custom_error_widget.dart';
import 'package:readify_book_store_app/Core/widgets/custom_loading_indecator.dart';
import 'package:readify_book_store_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/custom_book_image.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kBookDetailsView,
                          extra: state.books[index],
                        );
                      },
                      child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            'assets/images/no_book_cover.jpg',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
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
