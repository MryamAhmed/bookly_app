import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'book_list_view.dart';
import 'custome_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                CustomeAppBar(),
                BooksListView(),
                SizedBox(height: 50,),
                Text(
                  'Best Seller',
                  style:Style.textStyle18 ,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerList(),
          ),
        )
      ],
    );


  }
}



