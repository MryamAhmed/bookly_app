import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custome_error_widget.dart';
import '../../manger/featured_books_cubit.dart';
import 'custome_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder: (context,state) {
        if(state is FeaturedBooksSuccess){
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:(context,index){
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(
                          AppRouter.BookDetailsViewPath,
                          extra: state.books[0]);
                    },
                    child: ListViewItem(
                      imageUrl: state.books[index].volumeInfo.imageLinks
                          ?.thumbnail ??
                          '',
                    ),
                  ),
                );
              },
            ),
          );
        }else if(state is FeaturedBooksFailure){
          return CustomeErrorWidget(errorMessage: state.errorMessage,);
        }else{
          return const Center(child: CircularProgressIndicator());
        }

      }
    );
  }
}