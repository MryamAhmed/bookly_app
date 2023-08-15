import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widgets/custome_button.dart';
import '../../../data/models/book_model/book_model.dart';

class BookAction extends StatelessWidget {
  const BookAction({Key? key,required this.bookModel}) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadious: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: ()async{
                await LunchCustomUr(context);
              },
              fontsize: 16,
              text: getText(bookModel),
              backgroundColor: Color(0xffEF8262),
              textColor: Colors.white,
              borderRadious: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> LunchCustomUr(BuildContext context) async {

    Uri uri  = Uri.parse(bookModel.volumeInfo.previewLink!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ca\'t Lunch this url'))
      );
    }
  }

  String getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null){
      return 'Not Avaliable';
    }else{
      return 'free prevoid';
    }
    //
  }
}