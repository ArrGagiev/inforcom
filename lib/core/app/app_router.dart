import 'package:go_router/go_router.dart';
import 'package:inforcom/core/app/app_layout.dart';
import 'package:inforcom/features/main/main_page.dart';
import 'package:inforcom/features/map/map_page.dart';
import 'package:inforcom/features/promo/promo_page.dart';
import 'package:inforcom/features/support/support_page.dart';
import 'package:inforcom/features/profile/profile_page.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/main',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppLayout(navigationShell: navigationShell);
      },
      branches: [
        // Главная
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/main',
              builder: (context, state) => const MainPage(),
              // Это вложенный маршрут -> (/main/details), который:
              // Относится к /main (так как находится внутри его routes).
              // Мог бы использоваться для отображения деталей на главной
              // вкладке (например, если MainPage – это список,
              // а details – страница элемента).

              // routes: [
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) =>
              //         const Scaffold(body: Center(child: Text('Main details'))),
              //   ),
              // ],
            ),
          ],
        ),

        // Карта
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/map', builder: (context, state) => const MapPage()),
          ],
        ),

        // Акции
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/promo',
              builder: (context, state) => const PromoPage(),
            ),
          ],
        ),

        // Поддержка
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/support',
              builder: (context, state) => const SupportPage(),
            ),
          ],
        ),

        // Профиль
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
