import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarDataPage extends StatelessWidget {
  const CarDataPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuotationSample(
        title: carDataTitle,
        homeAction: () {
          context.go(AppRouter.home);
        },
        floatingAction: () {
          //usar go router para ir a la siguiente pagina
        },
        backAction: (){
          //usar go router para ir a la siguiente anterior
          context.go(AppRouter.home);
        },
        content: Column(
          children: [Text("Holita")],
        ));
  }
}
