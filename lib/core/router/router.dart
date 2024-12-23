import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/calendar/presentation/screen/add_event_screen.dart';
import '../../features/calendar/presentation/screen/calender_view.dart';
import '../../features/dashboard/presentation/screen/dashboard_screen.dart';
import '../../features/home/home.dart';
import '../../features/timer/presentation/screen/timer_screen.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: AppRoute.dashboard.path,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) =>
          Home(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              name: AppRoute.dashboard.name,
              path: AppRoute.dashboard.path,
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoute.timer.name,
              path: AppRoute.timer.path,
              builder: (context, state) => const TimerScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoute.calendar.name,
              path: AppRoute.calendar.path,
              builder: (context, state) => const CalendarScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.eventDetails.path,
      name: AppRoute.eventDetails.name,
      builder: (context, state) {
        Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
        return AddEventScreen(
          isEdit: extra != null,
        );
      },
    )
  ],
);
