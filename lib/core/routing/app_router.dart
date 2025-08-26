import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inforcom/core/app/app_layout.dart';
import 'package:inforcom/core/routing/app_routes.dart';
import 'package:inforcom/core/services/auth_service.dart';
import 'package:inforcom/features/main/main_page.dart';
import 'package:inforcom/features/map/map_page.dart';
import 'package:inforcom/features/profile/pages/add_card/add_card_page.dart';
import 'package:inforcom/features/promo/promo_details/promo_detail_page.dart';
import 'package:inforcom/features/promo/promo_page.dart';
import 'package:inforcom/features/splash/splash_page.dart';
import 'package:inforcom/features/support/support_page.dart';
import 'package:inforcom/features/profile/profile_page.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: AppRoutes.splash,
  routes: [
    //----------------------------------------------------------
    // Экран заставка
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    //----------------------------------------------------------
    // Главный маршрут экранов приложения
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
              routes: [
                _buildRouteWithPadding(
                  path: AppRoutes.promoDetails,
                  child: const PromoDetailPage(),
                ),
              ],
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
              child: AuthService.isAuth
                  ? const ProfilePage()
                  : const SplashPage(),
              routes: [
                _buildRouteWithPadding(
                  path: AppRoutes.addCard,
                  child: const AddCardPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

GoRoute _buildRouteWithPadding({
  required String path,
  required Widget child,
  List<GoRoute> routes = const [],
}) {
  return GoRoute(
    path: path,
    builder: (context, state) => SafeArea(
      top: false,
      bottom: false,
      child: Padding(padding: const EdgeInsets.only(bottom: 32), child: child),
    ),
    routes: routes,
  );
}
