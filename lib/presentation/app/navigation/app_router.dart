import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:piris1/presentation/pages/edit/edit_page.dart';
import 'package:piris1/presentation/pages/main/main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(page: EditPage,),
  ],
)

class $AppRouter {}
