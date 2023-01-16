// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transactions_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  var userTransactions = [
    Transaction(
      id: 'T1',
      title: 'Shoes',
      amount: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'New Phone',
      amount: 500,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    var NewTx = Transaction(
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: txTitle);

    setState(() {
      userTransactions.add(NewTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(userTransactions),
      ],
    );
  }
}
