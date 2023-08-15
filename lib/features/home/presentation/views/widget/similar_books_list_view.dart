import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custome_error_widget.dart';
import '../../manger/simillar_book_cubit.dart';
import 'custome_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimillarBookCubit,SimillarBookState>(
      builder: (BuildContext context, state) {
        if(state is FeaturedBooksSuccess){
          return  SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:(context,index){
                return  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ListViewItem(
                      imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? ''
                  ),
                );
              },
            ),
          );
        }else if(state is SimillarBooksFailure){
          return CustomeErrorWidget(errorMessage: state.errorMessage,);
        }else {
          return const Center(child: CircularProgressIndicator());
        }

      },

    );
  }
}
