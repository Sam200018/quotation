import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class QuotationText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? colorText;

  const QuotationText(
      {super.key, required this.text, this.size, this.fontWeight, this.colorText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colorText,
        fontSize: size ?? 15.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
