import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QuotationSample(
        title: "",
        homeAction: () {},
        floatingAction: () {},
        content: Text("hola"));
  }
}
