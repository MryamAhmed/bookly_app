import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/styles.dart';
import 'book_ratting.dart';
import 'custome_list_view_item.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key,required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(
            AppRouter.BookDetailsViewPath,
        extra: bookModel);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1.5/2,
              child:ListViewItem(
                imageUrl: bookModel.volumeInfo.imageLinks
                    ?.thumbnail ??
                    '',
              )
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyle20.copyWith(//fontFamily: ),
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                    bookModel.volumeInfo.authors![0],
                    style: Style.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'free',
                        style: Style.textStyle20.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                       BookRatting(
                        cunt:bookModel.volumeInfo.ratingsCount??0,
                        rating: bookModel.volumeInfo.averageRating??0 ,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


