import 'package:go_router/go_router.dart';
import 'package:traveler_provider/presentation/pages/home_page.dart';
import 'package:traveler_provider/presentation/pages/second_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) => const SecondPage(),
    ),
  ],
);