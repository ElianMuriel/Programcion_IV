import 'package:go_router/go_router.dart';

import 'pages/real_estate_home_page.dart';
import 'pages/rent_page.dart';
import 'pages/discount_page.dart';
import 'pages/property_package_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const RealEstateHomePage(),
    ),
    GoRoute(
      path: '/rent',
      builder: (_, __) => const RentPage(),
    ),
    GoRoute(
      path: '/discount',
      builder: (_, __) => const DiscountPage(),
    ),
    GoRoute(
      path: '/package',
      builder: (_, __) => const PropertyPackagePage(),
    ),
  ],
);
