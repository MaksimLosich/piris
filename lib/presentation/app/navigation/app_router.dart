import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:piris1/presentation/pages/deposit/deposit_page.dart';
import 'package:piris1/presentation/pages/details/details_page.dart';
import 'package:piris1/presentation/pages/edit/edit_page.dart';
import 'package:piris1/presentation/pages/home/home_page.dart';
import 'package:piris1/presentation/pages/main/main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: EditPage,),
    AutoRoute(page: MainPage,),
    AutoRoute(page: DepositPage,),
    AutoRoute(page: DetailsPage,),
  ],
)

class $AppRouter {}
