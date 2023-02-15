// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../../domain/entities/user.dart' as _i5;
import '../../pages/edit/edit_page.dart' as _i2;
import '../../pages/main/main_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    EditRoute.name: (routeData) {
      final args =
          routeData.argsAs<EditRouteArgs>(orElse: () => const EditRouteArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.EditPage(
          user: args.user,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          MainRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          EditRoute.name,
          path: '/edit-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.EditPage]
class EditRoute extends _i3.PageRouteInfo<EditRouteArgs> {
  EditRoute({
    _i5.User? user,
    _i4.Key? key,
  }) : super(
          EditRoute.name,
          path: '/edit-page',
          args: EditRouteArgs(
            user: user,
            key: key,
          ),
        );

  static const String name = 'EditRoute';
}

class EditRouteArgs {
  const EditRouteArgs({
    this.user,
    this.key,
  });

  final _i5.User? user;

  final _i4.Key? key;

  @override
  String toString() {
    return 'EditRouteArgs{user: $user, key: $key}';
  }
}
