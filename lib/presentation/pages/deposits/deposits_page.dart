import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piris1/presentation/app/di/injector.dart';
import 'package:piris1/presentation/app/navigation/app_router.gr.dart';
import 'package:piris1/presentation/pages/deposits/deposits_cubit.dart';
import 'package:piris1/presentation/pages/deposits/deposits_state.dart';
import 'package:piris1/presentation/pages/details/details_page.dart';

class DepositsPage extends StatefulWidget {
  const DepositsPage({Key? key}) : super(key: key);

  @override
  State<DepositsPage> createState() => _DepositsPageState();
}

class _DepositsPageState extends State<DepositsPage> {
  final cubit = i.get<DepositsCubit>();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositsCubit, DepositsState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.router.push(DepositRoute()).then((value) => cubit.init());
            },
          ),
          appBar: AppBar(
            title: const Text('Список депозитов'),
            actions: [
              IconButton(onPressed: () {cubit.skip(1);}, icon: const Text('1')),
              IconButton(onPressed: () {cubit.skip(6);}, icon: const Text('6')),
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              ...state.deposits
                  .map(
                    (deposit) => ListTile(
                      title: Text(
                          state.users.where((user) => deposit.userId == user.id).first.lastName),
                      subtitle: Text('${deposit.term}, ${deposit.summ}'),
                      onTap: () => Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                account1: state.accounts.where((account) => deposit.accountId == account.id).first,
                                account2: state.accounts.where((account) => deposit.accountId2 == account.id).first,
                                user: state.users.where((user) => deposit.userId == user.id).first,
                                deposit: deposit,
                              ),
                            ),
                          )
                          .then((value) => cubit.init()),
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
