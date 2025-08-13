import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inforcom/core/app/app_layout.dart';
import 'package:inforcom/core/routing/app_routes.dart';
import 'package:inforcom/features/main/main_page.dart';
import 'package:inforcom/features/map/map_page.dart';
import 'package:inforcom/features/promo/promo_page.dart';
import 'package:inforcom/features/support/support_page.dart';
import 'package:inforcom/features/profile/profile_page.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: AppRoutes.main,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppLayout(navigationShell: navigationShell);
      },
      branches: [
        // Главная
        StatefulShellBranch(
          routes: [
            _buildRouteWithPadding(
              path: AppRoutes.main,
              child: const MainPage(),
            ),
          ],
        ),

        // Карта
        StatefulShellBranch(
          routes: [
            _buildRouteWithPadding(path: AppRoutes.map, child: const MapPage()),
          ],
        ),

        // Акции
        StatefulShellBranch(
          routes: [
            _buildRouteWithPadding(
              path: AppRoutes.promo,
              child: const PromoPage(),
            ),
          ],
        ),

        // Поддержка
        StatefulShellBranch(
          routes: [
            _buildRouteWithPadding(
              path: AppRoutes.support,
              child: const SupportPage(),
            ),
          ],
        ),

        // Профиль
        StatefulShellBranch(
          routes: [
            _buildRouteWithPadding(
              path: AppRoutes.profile,
              child: const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

GoRoute _buildRouteWithPadding({required String path, required Widget child}) {
  return GoRoute(
    path: path,
    builder: (context, state) => SafeArea(
      top: false,
      bottom: false,
      child: Padding(padding: EdgeInsets.only(bottom: 32), child: child),
    ),
  );
}
