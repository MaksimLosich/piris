import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:piris1/domain/entities/account.dart';
import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/deposit.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';
import 'package:piris1/domain/entities/user.dart';
import 'package:piris1/presentation/app/di/injector.dart';
import 'package:piris1/presentation/pages/details/details_cubit.dart';
import 'package:piris1/presentation/pages/details/details_state.dart';
import 'package:piris1/presentation/widgets/app_elevated_button.dart';
import 'package:piris1/presentation/widgets/app_text_field.dart';

class DetailsPage extends StatefulWidget {
  final Deposit deposit;
  final Account account1;
  final Account account2;
  final User user;

  const DetailsPage({
    required this.user,
    required this.deposit,
    required this.account1,
    required this.account2,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final cubit = i.get<DetailsCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Депозит'),
            actions: [
              if (widget.deposit.revokable)
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Закрыть?'),
                        actions: [
                          TextButton(
                            child: const Text('Нет'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Да'),
                            onPressed: () {
                              cubit.closeDeposit(widget.deposit, widget.account1, widget.account2);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ).then((value) => Navigator.of(context).pop());
                  },
                  icon: const Icon(Icons.close),
                ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(widget.deposit.number),
                const SizedBox(height: 12),
                const Text('Ставка'),
                Text('${widget.deposit.percent}%'),
                const SizedBox(height: 12),
                const Text('Счет 1'),
                Text(widget.account1.id),
                Text('${widget.account1.sum}'),
                const SizedBox(height: 12),
                const Text('Счет 2'),
                Text(widget.account2.id),
                Text('${widget.account2.sum}'),
                const SizedBox(height: 12),
                Text(widget.deposit.start.toString()),
                Text(widget.deposit.end.toString()),
                Text(widget.deposit.term.toString()),
                Text('${widget.deposit.summ} ${widget.deposit.currency == 1 ? 'USD' : 'BYN'}'),
                Text(widget.deposit.isClosed ? 'Закрыт' : 'Открыт'),
                Text(widget.deposit.revokable ? 'Возвратный' : 'Невозвратный'),
                Text('${widget.user.firstName} ${widget.user.lastName}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
