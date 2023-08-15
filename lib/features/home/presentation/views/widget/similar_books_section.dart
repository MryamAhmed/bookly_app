import 'package:bookly/features/home/presentation/views/widget/similar_books_list_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hi maryam ahmed',
            style: Style.textStyle16.copyWith(
                fontWeight: FontWeight.w600
            )),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
