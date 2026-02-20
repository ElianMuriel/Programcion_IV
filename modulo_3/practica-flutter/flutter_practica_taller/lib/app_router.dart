import 'package:go_router/go_router.dart';

import 'pages/workshop_home_page.dart';
import 'pages/labor_page.dart';
import 'pages/parts_page.dart';
import 'pages/service_package_page.dart';
import 'pages/alignment_balance_page.dart';
import 'pages/quick_diagnostic_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const WorkshopHomePage(),
    ),
    GoRoute(
      path: '/labor',
      builder: (_, __) => const LaborPage(),
    ),
    GoRoute(
      path: '/parts',
      builder: (_, __) => const PartsPage(),
    ),
    GoRoute(
      path: '/service',
      builder: (_, __) => const ServicePackagePage(),
    ),
    GoRoute(
      path: '/alignament_balance',
      builder: (_, __) => const AlignmentBalancePage(),
    ),
    GoRoute(
      path: '/quick_diagnostick',
      builder: (_, __) => const QuickDiagnostickPage(),
    ),
  ],
);
