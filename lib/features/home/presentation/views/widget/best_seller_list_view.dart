import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custome_error_widget.dart';
import '../../manger/newset_books_cubit.dart';
import 'best_seller_list_view_item.dart';


class BestSellerList extends StatelessWidget {
  const BestSellerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit,NewsetBooksState>(
      builder: (context,state) {
        if(state is NewsetBooksSuccess){
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics() , // to prevent it from scrolle
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context , index){
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              });
        }else if(state is NewsetBooksFailure){
          return CustomeErrorWidget(errorMessage: state.errorMessage,);
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}