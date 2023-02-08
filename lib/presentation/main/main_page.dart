import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piris1/presentation/app/di/injector.dart';
import 'package:piris1/presentation/main/main_cubit.dart';
import 'package:piris1/presentation/main/main_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final cubit = i.get<MainCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('User list'),
          ),
          body: ListView(),
        );
      },
    );
  }
}
