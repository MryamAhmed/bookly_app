import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/repos/home_repo_implem.dart';
import '../../features/home/presentation/manger/simillar_book_cubit.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class AppRouter {
  static String homeViewPath = '/homeView';
  static String BookDetailsViewPath = '/BookDetailsViewPath';
  static String SearcgViewPath = '/SearchView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: homeViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),

      GoRoute(
        path: BookDetailsViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create: (BuildContext context) =>  SimillarBookCubit(
                  getIt.get<HomeRepoImpl>()
              ),
              child:  BookDetailsView(bookModel: state.extra as BookModel,
              ));
        },
      ),

      GoRoute(
        path: SearcgViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return const SerchView();
        },
      ),
    ],
  );

}