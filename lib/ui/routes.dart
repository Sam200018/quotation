import 'package:CotizApp/ui/pages/home_page.dart';
import 'package:CotizApp/ui/pages/car_data_page.dart';
import 'package:CotizApp/ui/pages/personal_data_page.dart';
import 'package:CotizApp/ui/pages/result_page.dart';
import 'package:CotizApp/ui/pages/state_car.dart';
import 'package:go_router/go_router.dart';

import 'pages/insurance_data_page.dart';

class AppRouter {
  static String home = "/";
  static String carData = "/carData";
  static String stateCar = "/stateCar";
  static String persData = "/personalData";
  static String insuData = "/insuranceData";
  static String result = "/result";

  GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(path: home, builder: (context, state) => const HomePage()),
      GoRoute(path: carData,builder: (context, state) => const CarDataPage()),
      GoRoute(path: stateCar,builder: (context, state) => const StateCarPage()),
      GoRoute(path: persData,builder: (context, state) => const PersonalDataPage()),
      GoRoute(path: insuData,builder: (context, state) => const InsuranceDataPage()),
      GoRoute(path: result,builder: (context,state)=> const ResultPage())
    ],
  );
}


