import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piris1/presentation/app/di/injector.dart';
import 'package:piris1/presentation/app/navigation/app_router.gr.dart';
import 'package:piris1/presentation/pages/edit/edit_page.dart';
import 'package:piris1/presentation/pages/main/main_cubit.dart';
import 'package:piris1/presentation/pages/main/main_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final cubit = i.get<MainCubit>();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.router.push(EditRoute()).then((value) => cubit.init());
            },
          ),
          appBar: AppBar(
            title: const Text('Список пользователей'),
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              ...state.users
                  .map(
                    (user) => ListTile(
                      title: Text('${user.lastName} ${user.firstName} ${user.middleName}'),
                      subtitle: Text(
                          '${user.passportSeries}${user.passportNumber} ${user.passportIdNumber}'),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditPage(user: user),
                        ),
                      ).then((value) => cubit.init()),
                    ),
                  )
                  .toList(),
            ],
          ),
        );
      },
    );
  }
}
