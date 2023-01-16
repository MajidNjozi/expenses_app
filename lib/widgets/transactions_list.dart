import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> myTransaction;

  TransactionList(this.myTransaction);

  @override
  Widget build(BuildContext context) {
    var currency = 'Tshs';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: (myTransaction.map((tx) {
        return SizedBox(
          height: 80,
          width: 50,
          child: Card(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid)),
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '$currency ${tx.amount}',
                      style: TextStyle(
                        color: Colors.orangeAccent[700],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(DateFormat.yMMMEd().format(tx.date),
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              )),
        );
      }).toList()),
    );
  }
}
