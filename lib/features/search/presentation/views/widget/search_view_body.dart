import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custome_search_text_field.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style:Style.textStyle18 ,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
              child: SearchResultListView())
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context , index){
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: //BestSellerListViewItem(),
            Text('')
          );
        });
  }
}


