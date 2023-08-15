import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BookRatting extends StatelessWidget {
  const BookRatting({Key? key,this.mainAxisAlignment = MainAxisAlignment.start,required this.rating , required this.cunt}) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final num rating ;
  final int cunt;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        const SizedBox(
          width: 6.3,
        ),
         Text(
          rating.toString(),
          style: Style.textStyle16,),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            cunt.toString(),
            style: Style.textStyle14.copyWith(
                color: const Color(0xff707070),
                fontWeight: FontWeight.w600
            ),
          ),
        ),
      ],
    );
  }
}