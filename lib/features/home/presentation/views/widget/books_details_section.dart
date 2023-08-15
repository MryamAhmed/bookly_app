import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'book_ratting.dart';
import 'books_action.dart';
import 'custome_list_view_item.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({Key? key,required this.bookModel}) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var widthController = MediaQuery.of(context).size.width ;
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthController*.2),
          child:  ListViewItem(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail?? ' '),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Style.textStyle30.copyWith(
              fontWeight: FontWeight.bold
          )
          ,
        textAlign: TextAlign.center,),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
              bookModel.volumeInfo.authors![0],
              style: Style.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic
              )),
        ),
        const SizedBox(
          height: 18,
        ),
         BookRatting(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? 0,
          cunt: bookModel.volumeInfo.ratingsCount ?? 0,

        ),
        const SizedBox(
          height: 37,
        ),
         BookAction(
          bookModel: bookModel,
        ),
      ],
    );

  }
}
