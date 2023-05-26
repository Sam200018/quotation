
import 'package:CotizApp/ui/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String home = "/";

  GoRouter router = GoRouter(
    routes: [
      GoRoute(path: home, builder: (context, state) => const HomePage())
    ],
  );
}
