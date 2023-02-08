import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piris1/presentation/app/navigation/app_router.gr.dart';
import 'package:piris1/presentation/base/base_page.dart';
import 'app_cubit.dart';
import 'app_state.dart';

class App extends BasePage {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends BasePageState<App, AppCubit>{
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      bloc: cubit,
      builder: (context, state) {
        return MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (context, widget) => widget!,
        );
      },
    );
  }
}
