
//import 'dart:js';

import 'package:CotizApp/ui/pages/home_page.dart';
import 'package:CotizApp/ui/pages/car_data_page.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String home = "/";
  static String carData = "/carData";

  GoRouter router = GoRouter(
    routes: [
      GoRoute(path: home, builder: (context, state) => const HomePage()),
      GoRoute(path: carData,builder: (context, state) => const CarDataPage())
    ],
  );
}


