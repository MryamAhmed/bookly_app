import 'package:bookly/features/search/presentation/views/widget/search_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SerchView extends StatelessWidget {
  const SerchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SearchViewBody()
      ),
    );
  }
}
