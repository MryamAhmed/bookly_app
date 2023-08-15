import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.backgroundColor,this.borderRadious,required this.textColor,required this.text, this.fontsize, this.onPressed}) : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadious;
  final String text;
  final double? fontsize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:borderRadious ??  BorderRadius.circular(
                  12
              )
            ),
            backgroundColor: backgroundColor
          ),
          child: Text(
            text,
          style: Style.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
              fontSize: fontsize,
          ),
          )),
    );
  }
}
