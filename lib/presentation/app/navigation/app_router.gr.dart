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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../../domain/entities/account.dart' as _i10;
import '../../../domain/entities/deposit.dart' as _i9;
import '../../../domain/entities/user.dart' as _i8;
import '../../pages/deposit/deposit_page.dart' as _i4;
import '../../pages/details/details_page.dart' as _i5;
import '../../pages/edit/edit_page.dart' as _i2;
import '../../pages/home/home_page.dart' as _i1;
import '../../pages/main/main_page.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    EditRoute.name: (routeData) {
      final args =
          routeData.argsAs<EditRouteArgs>(orElse: () => const EditRouteArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.EditPage(
          user: args.user,
          key: args.key,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
      );
    },
    DepositRoute.name: (routeData) {
      final args = routeData.argsAs<DepositRouteArgs>(
          orElse: () => const DepositRouteArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.DepositPage(
          user: args.user,
          key: args.key,
        ),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.DetailsPage(
          user: args.user,
          deposit: args.deposit,
          account1: args.account1,
          account2: args.account2,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          EditRoute.name,
          path: '/edit-page',
        ),
        _i6.RouteConfig(
          MainRoute.name,
          path: '/main-page',
        ),
        _i6.RouteConfig(
          DepositRoute.name,
          path: '/deposit-page',
        ),
        _i6.RouteConfig(
          DetailsRoute.name,
          path: '/details-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EditPage]
class EditRoute extends _i6.PageRouteInfo<EditRouteArgs> {
  EditRoute({
    _i8.User? user,
    _i7.Key? key,
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

  final _i8.User? user;

  final _i7.Key? key;

  @override
  String toString() {
    return 'EditRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-page',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i4.DepositPage]
class DepositRoute extends _i6.PageRouteInfo<DepositRouteArgs> {
  DepositRoute({
    _i8.User? user,
    _i7.Key? key,
  }) : super(
          DepositRoute.name,
          path: '/deposit-page',
          args: DepositRouteArgs(
            user: user,
            key: key,
          ),
        );

  static const String name = 'DepositRoute';
}

class DepositRouteArgs {
  const DepositRouteArgs({
    this.user,
    this.key,
  });

  final _i8.User? user;

  final _i7.Key? key;

  @override
  String toString() {
    return 'DepositRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i5.DetailsPage]
class DetailsRoute extends _i6.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    required _i8.User user,
    required _i9.Deposit deposit,
    required _i10.Account account1,
    required _i10.Account account2,
    _i7.Key? key,
  }) : super(
          DetailsRoute.name,
          path: '/details-page',
          args: DetailsRouteArgs(
            user: user,
            deposit: deposit,
            account1: account1,
            account2: account2,
            key: key,
          ),
        );

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    required this.user,
    required this.deposit,
    required this.account1,
    required this.account2,
    this.key,
  });

  final _i8.User user;

  final _i9.Deposit deposit;

  final _i10.Account account1;

  final _i10.Account account2;

  final _i7.Key? key;

  @override
  String toString() {
    return 'DetailsRouteArgs{user: $user, deposit: $deposit, account1: $account1, account2: $account2, key: $key}';
  }
}
