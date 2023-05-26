import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class QuotationApp extends StatelessWidget {
  const QuotationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: "CotizApp",
          routerConfig: AppRouter().router,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
        );
      },
    );
  }
}
