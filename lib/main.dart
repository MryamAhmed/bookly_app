import 'package:flutter/material.dart';
import 'const.dart';
import 'core/utils/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_implem.dart';
import 'features/home/presentation/manger/featured_books_cubit.dart';
import 'features/home/presentation/manger/newset_books_cubit.dart';

void main() {
  setUp();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
          create:(context) => FeaturedBooksCubit(
              getIt.get<HomeRepoImpl>()
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
            create:(context) => NewsetBooksCubit(
                getIt.get<HomeRepoImpl>()
            )..fetchNewsBooks()
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
              //textTheme:GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}

