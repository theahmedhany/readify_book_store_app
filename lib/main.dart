import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readify_book_store_app/Core/utils/app_router.dart';
import 'package:readify_book_store_app/Core/utils/service_locator.dart';
import 'package:readify_book_store_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:readify_book_store_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:readify_book_store_app/Features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:readify_book_store_app/constants.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewsetBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
