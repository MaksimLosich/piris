import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piris1/domain/entities/user.dart';
import 'package:piris1/presentation/app/di/injector.dart';
import 'package:piris1/presentation/pages/deposit/deposit_cubit.dart';
import 'package:piris1/presentation/pages/deposit/deposit_state.dart';
import 'package:piris1/presentation/widgets/app_elevated_button.dart';
import 'package:piris1/presentation/widgets/app_text_field.dart';

class DepositPage extends StatefulWidget {
  final User? user;

  const DepositPage({
    this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final cubit = i.get<DepositCubit>();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositCubit, DepositState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.user == null ? 'Создание' : 'Редактирование'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView(
              shrinkWrap: true,
              children: [
                AppTextField(controller: cubit.termController, hint: 'Длительность (мес)'),
                AppTextField(controller: cubit.sumController, hint: 'Сумма'),
                AppTextField(controller: cubit.percentController, hint: 'Проценты'),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: state.revokable,
                      onChanged: (value) {
                        cubit.setRevokable(value!);
                      },
                    ),
                    const Text('Возвратный'),
                    Radio<bool>(
                      value: false,
                      groupValue: state.revokable,
                      onChanged: (value) {
                        cubit.setRevokable(value!);
                      },
                    ),
                    const Text('Невозвратный'),
                  ],
                ),
                DropdownButton<int>(
                  value: state.currency,
                  hint: const Text('Валюта'),
                  onChanged: (int? curr) {
                    cubit.setCurrency(curr);
                  },
                  items: const [
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text('USD'),
                    ),
                    DropdownMenuItem<int>(
                      value: 2,
                      child: Text('BYN'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                DropdownButton<User>(
                  value: state.user,
                  hint: const Text('Клиент'),
                  onChanged: (User? user) {
                    cubit.setUser(user);
                  },
                  items: state.users
                      .map(
                        (e) => DropdownMenuItem<User>(
                          value: e,
                          child: Text('${e.firstName} ${e.lastName}'),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 12),
                AppElevatedButton(onTap: () {cubit.createOrSave();}, title: 'Сохранить'),
              ],
            ),
          ),
        );
      },
    );
  }
}
