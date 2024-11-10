import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/dashboard/dashboard.dart';
import '../screens/login/login.dart';

class AppRouter {
  static GoRouter router(VoidCallback toggleTheme) => GoRouter(
        initialLocation: '/login',
        routes: [
          GoRoute(
            path: '/login',
            builder: (context, state) => LoginScreen(toggleTheme: toggleTheme),
          ),
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
        ],
      );
}
