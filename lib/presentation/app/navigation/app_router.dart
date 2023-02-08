import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:piris1/presentation/main/main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true),
  ],
)

class $AppRouter {}
