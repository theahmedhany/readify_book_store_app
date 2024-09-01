import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readify_book_store_app/Core/utils/styles.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:readify_book_store_app/Features/search/presentation/manager/books_search_cubit/books_search_cubit.dart';
import 'package:readify_book_store_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:readify_book_store_app/Features/search/presentation/views/widgets/search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBookDetailsAppBar(),
          CustomSearchTextField(
            onChanged: (query) {
              BlocProvider.of<BooksSearchCubit>(context)
                  .fetchSearchedBooks(query: query);
            },
          ),
          const SizedBox(height: 32),
          const Text(
            'Search Result',
            style: Styles.textStyle26,
          ),
          const SizedBox(height: 24),
          const Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
