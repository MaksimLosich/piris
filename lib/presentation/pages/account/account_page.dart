import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piris1/domain/entities/account.dart';
import 'package:piris1/presentation/app/di/injector.dart';
import 'package:piris1/presentation/pages/account/account_cubit.dart';

import 'account_state.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final cubit = i.get<AccountCubit>();

  @override
  void initState() {
    cubit.getAcc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Фонд'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView(
              shrinkWrap: true,
              children: [
                if (state.account != null) ...[
                  Text(state.account!.id),
                  Text(state.account!.sum.toString()),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
